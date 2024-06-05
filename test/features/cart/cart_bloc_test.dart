import 'package:bloc_test/bloc_test.dart';
import 'package:data/api_service.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/repo/cart_repo.dart';
import 'package:domain/usecase/get_cart_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:store_with_flutter/di/bloc_provider.dart';
import 'package:store_with_flutter/di/repo_provider.dart';
import 'package:store_with_flutter/di/usecase_provider.dart';
import 'package:store_with_flutter/features/cart/cart_bloc.dart';

@GenerateNiceMocks([MockSpec<GetCartUseCase>()])
import 'cart_bloc_test.mocks.dart';

void main() {
  late CartBloc bloc;
  late MockGetCartUseCase getCartUseCase;

  setUp(() {
    getCartUseCase = MockGetCartUseCase();
    when(getCartUseCase.execute(any)).thenAnswer((_) async => CartModel(
        id: 4,
        userId: 2,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]));
    bloc = CartBloc(getCartUseCase);
  });
  test("CartBlocLoading equatable test", () {
    final CartBlocLoading loading = CartBlocLoading();
    expect(loading, CartBlocLoading());
  });
  test("CartBlocLoaded equatable test", () {
    final CartBlocLoaded loaded = CartBlocLoaded(CartModel(
        id: 4,
        userId: 2,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]));
    expect(
        loaded,
        CartBlocLoaded(CartModel(
            id: 4,
            userId: 2,
            date: DateTime(2020, 6, 3),
            products: const [ProductCartModel(productId: 1, quantity: 3)])));
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
  });
  blocTest<CartBloc, CartBlocState>(
      'emits [CartBlocLoading,CartBlocLoaded] when FetchCart is added',
      build: () => bloc,
      act: (bloc) => bloc.add(FetchCart()),
      expect: () => [
            CartBlocLoading(),
            CartBlocLoaded(CartModel(
                id: 4,
                userId: 2,
                date: DateTime(2020, 6, 3),
                products: const [ProductCartModel(productId: 1, quantity: 3)]))
          ]);

  blocTest<CartBloc, CartBlocState>(
      'emits [CartBlocLoading,CartBlocLoaded] when FetchCart is added',
      build: () {
        when(getCartUseCase.execute(any)).thenAnswer((_) async => CartModel(
            id: 4,
            userId: 2,
            date: DateTime(2020, 6, 3),
            products: const [ProductCartModel(productId: 1, quantity: 3)]));
        return bloc;
      },
      act: (bloc) => bloc.add(FetchCart()),
      expect: () => [
            CartBlocLoading(),
            CartBlocLoaded(CartModel(
                id: 4,
                userId: 2,
                date: DateTime(2020, 6, 3),
                products: const [ProductCartModel(productId: 1, quantity: 3)]))
          ]);
}
