import 'package:bloc_test/bloc_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/api_service.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/model/product_model.dart';
import 'package:domain/repo/cart_repo.dart';
import 'package:domain/usecase/get_cart_usecase.dart';
import 'package:domain/usecase/get_product_by_id_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_with_flutter/di/bloc_provider.dart';
import 'package:store_with_flutter/di/repo_provider.dart';
import 'package:store_with_flutter/di/usecase_provider.dart';
import 'package:store_with_flutter/features/cart/cart_bloc.dart';
import 'package:store_with_flutter/features/cart/cart_page.dart';

@GenerateNiceMocks([MockSpec<GetCartUseCase>(),MockSpec<GetProductByIdUsecase>()])
import 'cart_bloc_test.mocks.dart';

void main() {
  late MockGetCartUseCase getCartUseCase;
  late MockGetProductByIdUsecase getProductByIdUsecase;

  setUp(() {
    getCartUseCase = MockGetCartUseCase();
    getProductByIdUsecase = MockGetProductByIdUsecase();
    when(getCartUseCase.execute(any)).thenAnswer((_) async => CartModel(
        id: 4,
        userId: 2,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]));
  });

  group("Dependency test", (){
    test('ApiService',(){
      expect(repositoryProvider,anyElement(isInstanceOf<RepositoryProvider<ApiService>>()));
    });
    test('Cart Repo',(){
      expect(repositoryProvider,anyElement(isInstanceOf<RepositoryProvider<CartRepo>>()));
    });
    test('GetProductsUsecase',(){
      expect(usecaseProviders,anyElement(isInstanceOf<RepositoryProvider<GetCartUseCase>>()));
    });
    test('GetProductByIdUsecase',(){
      expect(usecaseProviders,anyElement(isInstanceOf<RepositoryProvider<GetProductByIdUsecase>>()));
    });
  });
  group("Dependency test with bloc", (){
    GlobalKey testWidgetKey = GlobalKey();
    final Widget widget = MultiRepositoryProvider(
      providers: repositoryProvider,
      child: MultiBlocProvider(
        providers: blocProviders,
        child: MultiBlocProvider(
          providers: usecaseProviders,
          child: SizedBox(key: testWidgetKey,
          ),
        ),
      ),
    );
    testWidgets("ApiService", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(testWidgetKey), findsOneWidget);
      BuildContext context = tester.element(find.byKey(testWidgetKey));
      expect(RepositoryProvider.of<ApiService>(context), isNotNull );
    });
    testWidgets("Cart repo", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(testWidgetKey), findsOneWidget);
      BuildContext context = tester.element(find.byKey(testWidgetKey));
      expect(RepositoryProvider.of<CartRepo>(context), isNotNull );
    });
    testWidgets("Cart Usecase", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(testWidgetKey), findsOneWidget);
      BuildContext context = tester.element(find.byKey(testWidgetKey));
      expect(RepositoryProvider.of<GetCartUseCase>(context), isNotNull );
    });
    testWidgets("GetProductByIdUsecase", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(testWidgetKey), findsOneWidget);
      BuildContext context = tester.element(find.byKey(testWidgetKey));
      expect(RepositoryProvider.of<GetProductByIdUsecase>(context), isNotNull );
    });
  });
  test("CartBlocLoading equatable test", () {
    final CartBlocLoading loading = CartBlocLoading();
    expect(loading, CartBlocLoading());
  });
  test("CartBlocLoaded equatable test", () {
    final CartBlocLoaded loaded = CartBlocLoaded(cartItems:CartModel(
        id: 4,
        userId: 2,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]), loadingCart: true, products: const []);
    expect(
        loaded,
        CartBlocLoaded (
            cartItems: CartModel(
        id: 4,
        userId: 2,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]),
          loadingCart: true, products: const [],), );
  });

  {
    final cartResponse = CartModel(
        id: 4,
        userId: 2,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]);
    const productResponse = ProductModel(
        id: 1,
        title: "Product 1",
        price: 100,
        image: "image1",
        category: "category1",
        description: "description1",
        rating: RatingModel(rate: 1, count: 1));
    blocTest<CartBloc, CartBlocState>(
        'emits [CartBlocLoading,CartBlocLoaded] when FetchCart is added',
        setUp: () {
          when(getCartUseCase.execute(any)).thenAnswer((_) async => cartResponse);
          when(getProductByIdUsecase.execute(any)).thenAnswer((_) async => productResponse);
        },
        build: () => CartBloc(getCartUseCase, getProductByIdUsecase),
        expect: () => [
              CartBlocLoading(),
              CartBlocLoaded(
                  cartItems: cartResponse,
                  loadingCart: true,
                  products: const [] ),
              CartBlocLoaded(
                  cartItems: cartResponse,
                  loadingCart: false,
                  products: const [productResponse] )
            ]);
  }
  {
    final cartResponse = CartModel(
        id: 4,
        userId: 2,
        date: DateTime(2020, 6, 3),
        products: const [
          ProductCartModel(productId: 1, quantity: 3),
          ProductCartModel(productId: 2, quantity: 3),
          ProductCartModel(productId: 3, quantity: 3)
        ]);
    const List<ProductModel> productResponse = [
      ProductModel(
          id: 1,
          title: "Product 1",
          price: 100,
          image: "image1",
          category: "category1",
          description: "description1",
          rating: RatingModel(rate: 1, count: 1)),
      ProductModel(
          id: 2,
          title: "Product 2",
          price: 200,
          image: "image2",
          category: "category2",
          description: "description2",
          rating: RatingModel(rate: 2, count: 2)),
      ProductModel(
          id: 3,
          title: "Product 3",
          price: 300,
          image: "image3",
          category: "category3",
          description: "description3",
          rating: RatingModel(rate: 3, count: 3)),
    ];
    blocTest<CartBloc, CartBlocState>('load products after cart is loaded',
        setUp: () {
          when(getCartUseCase.execute(any))
              .thenAnswer((_) async => cartResponse);
          when(getProductByIdUsecase.execute(any)).thenAnswer((index) async {
            int id =
                (index.positionalArguments[0] as GetProductsByIdUsecaseParams)
                    .id;
            return productResponse.firstWhere((element) => element.id == id);
          });
        },
        build: () => CartBloc(getCartUseCase, getProductByIdUsecase),
        expect: () => [
              CartBlocLoading(),
              CartBlocLoaded(
                  cartItems: cartResponse,
                  loadingCart: true,
                  products: const []),
              CartBlocLoaded(
                  cartItems: cartResponse,
                  loadingCart: true,
                  products: [
                    productResponse[0],
                  ]),
              CartBlocLoaded(
                  cartItems: cartResponse,
                  loadingCart: true,
                  products: [productResponse[0], productResponse[1]]),
              CartBlocLoaded(
                  cartItems: cartResponse,
                  loadingCart: false,
                  products: [
                    productResponse[0],
                    productResponse[1],
                    productResponse[2]
                  ]),
            ]);
  }
  group("Cart product item widget test",(){
    const ProductModel product = ProductModel(
        id: 1,
        title: "test",
        price: 100,
        description: 'test desc',
        category: 'category test',
        image: 'img url',
        rating: RatingModel(rate: 1.0, count: 1));
    const ProductCartModel productCartModel = ProductCartModel(productId: 1, quantity: 3);
    const Widget page = MaterialApp(
        home: ProductCartItem(
          product:product, cartItem: productCartModel,
        ),
    );
    testWidgets("Title", (WidgetTester tester) async {
      await tester.pumpWidget(page);
      expect(find.text(product.title), findsOneWidget);
    });
    testWidgets("Quantity", (WidgetTester tester) async {
      await tester.pumpWidget(page);
      expect(find.text("Quantity: ${productCartModel.quantity}"), findsOneWidget);
    });
    testWidgets("Image", (WidgetTester tester) async {
      await tester.pumpWidget(page);
      expect(find.byType(CachedNetworkImage), findsWidgets);
      expect(find.byType(CachedNetworkImage), hasCachedImageWithUrl(product.image));
    });
  });
}

Matcher hasCachedImageWithUrl(String url) {
  return _HasCachedImageWithUrl(url);
}

class _HasCachedImageWithUrl extends Matcher {
  final String url;

  _HasCachedImageWithUrl(this.url);

  @override
  Description describe(Description description) {
    return description.add('CachedNetworkImage with url "$url"');
  }

  @override
  bool matches(item, Map matchState) {
    if (item is Finder) {
      CachedNetworkImage widget = item.evaluate().first.widget as CachedNetworkImage;
      return widget.imageUrl == url;
    }
    return false;
  }

  @override
  Description describeMismatch(item, Description mismatchDescription, Map matchState, bool verbose) {
    if (item is Finder) {
      CachedNetworkImage widget = item.evaluate().first.widget as CachedNetworkImage;
      return mismatchDescription.add('had url "${widget.imageUrl}"');
    } else {
      return mismatchDescription.add('was not a Finder');
    }
  }
}