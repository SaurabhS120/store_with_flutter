import 'package:bloc_test/bloc_test.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/usecase/get_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
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
