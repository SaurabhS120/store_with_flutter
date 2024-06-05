import 'package:domain/model/cart_model.dart';
import 'package:domain/repo/cart_repo.dart';
import 'package:domain/usecase/get_cart_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<CartRepo>(),MockSpec<GetCartUseCase>()])
import 'get_cart_usecase_test.mocks.dart';

void main(){

  late GetCartUseCase usecase;
  late CartRepo repo;

  setUp((){
    repo = MockCartRepo();
    usecase = GetCartUseCase(repo);
  });

  test('getCart', () async {
    when(usecase.getCart(GetCartUsecaseParam(1))).thenAnswer((_) async => []);
    final result = await usecase.getCart(GetCartUsecaseParam(1));
    expect(result, []);
  });

  test('Get cart usecase test with dummy response', (){
    final CartModel cartModel = CartModel(
      id: 1,
      userId: 1,
      date: DateTime(2021, 10, 10),
      products: const [
        ProductCartModel(productId: 10, quantity: 23),
        ProductCartModel(productId: 11, quantity: 12),
      ],
    );
    when(repo.getCart(1)).thenAnswer((_) async => [cartModel]);
    expect(usecase.getCart(GetCartUsecaseParam(1)), completion([cartModel]));
  });

}