import 'package:bloc_test/bloc_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:data/api_service.dart';
import 'package:domain/model/product_model.dart';
import 'package:domain/repo/products_repo.dart';
import 'package:domain/usecase/get_products_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_with_flutter/di/bloc_provider.dart';
import 'package:store_with_flutter/di/repo_provider.dart';
import 'package:store_with_flutter/di/usecase_provider.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';
import 'package:store_with_flutter/features/home/product_list_page.dart';

@GenerateNiceMocks([MockSpec<GetProductsUsecase>()])
import 'product_list_bloc_test.mocks.dart';

void main(){
  late ProductListBloc bloc;
  late MockGetProductsUsecase getProductsUsecase;

  setUp((){
    getProductsUsecase = MockGetProductsUsecase();
    when(getProductsUsecase.execute()).thenAnswer((_) async => []);
    bloc = ProductListBloc(getProductsUsecase);
  });
  group("Dependency test", (){
    test('ApiService',(){
      expect(repositoryProvider,anyElement(isInstanceOf<RepositoryProvider<ApiService>>()));
    });
    test('ProductsRepo',(){
      expect(repositoryProvider,anyElement(isInstanceOf<RepositoryProvider<ProductsRepo>>()));
    });
    test('GetProductsUsecase',(){
      expect(usecaseProviders,anyElement(isInstanceOf<RepositoryProvider<GetProductsUsecase>>()));
    });
  });
  group("Dependency test with bloc", (){
    GlobalKey testWidgetKey = GlobalKey();
    final widget = MaterialApp(
      home: MultiRepositoryProvider(
        providers: repositoryProvider,
        child: MultiBlocProvider(
          providers: blocProviders,
          child: MultiBlocProvider(
              providers: usecaseProviders,
              child: SizedBox(key: testWidgetKey,
              ),
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
    testWidgets("Products repo", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(testWidgetKey), findsOneWidget);
      BuildContext context = tester.element(find.byKey(testWidgetKey));
      expect(RepositoryProvider.of<ProductsRepo>(context), isNotNull );
    });
    testWidgets("Usecase", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(testWidgetKey), findsOneWidget);
      BuildContext context = tester.element(find.byKey(testWidgetKey));
      expect(RepositoryProvider.of<GetProductsUsecase>(context), isNotNull );
    });
  });
  test("ProductListBlocLoading equatable test", (){
    final ProductListBlocLoading loading = ProductListBlocLoading();
    expect(loading, ProductListBlocLoading());
  });
  test("ProductListBlocLoaded equatable test", (){
    final ProductListBlocLoaded loaded = ProductListBlocLoaded(const []);
    expect(loaded, ProductListBlocLoaded(const []));
  });
  blocTest<ProductListBloc,ProductListBlocState>(
    'emits [ProductListBlocLoading,ProductListBlocLoaded] when FetchProductList is added',
    build: () => bloc,
    act: (bloc) => bloc.add(FetchProductList()),
    expect: () => [ProductListBlocLoading(),ProductListBlocLoaded(const [])]
  );

  blocTest<ProductListBloc,ProductListBlocState>(
    'emits [ProductListBlocLoading,ProductListBlocLoaded] when FetchProductList is added',
    setUp: (){
      when(getProductsUsecase.execute()).thenAnswer((_) async => [
        const ProductModel(
            id: 1,
            title: "test",
            price: 100,
            description: 'test desc',
            category: 'category test',
            image: 'img url',
            rating: RatingModel(rate: 1.0, count: 1))
      ]);
    },
    build: ()=>bloc,
    act: (bloc) => bloc.add(FetchProductList()),
    expect: () => [
            ProductListBlocLoading(),
            ProductListBlocLoaded(const [
              ProductModel(
                  id: 1,
                  title: "test",
                  price: 100,
                  description: 'test desc',
                  category: 'category test',
                  image: 'img url',
                  rating: RatingModel(rate: 1.0, count: 1))
            ])
          ]);
  group("Product widget test",(){
    const ProductModel product = ProductModel(
        id: 1,
        title: "test",
        price: 100,
        description: 'test desc',
        category: 'category test',
        image: 'img url',
        rating: RatingModel(rate: 1.0, count: 1));
    const widget = MaterialApp(
      home: ProductItem(product: product),
    );
    testWidgets("title test", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(ProductItem), findsOneWidget);
      expect(find.text(product.title), findsOneWidget);
    });
    testWidgets("Price test", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(ProductItem), findsOneWidget);
      expect(find.text(product.price.toString()), findsOneWidget);
    });
    testWidgets("Image test", (WidgetTester tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(CachedNetworkImage), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is CachedNetworkImage && widget.imageUrl == product.image), findsOneWidget);
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