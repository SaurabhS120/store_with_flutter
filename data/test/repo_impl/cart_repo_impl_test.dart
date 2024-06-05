import 'package:data/api_service.dart';
import 'package:data/entity/cart_entity.dart';
import 'package:data/repo_impl/cart_repo_impl.dart';
import 'package:domain/model/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ApiService>(),MockSpec<CartRepoImpl>()])
import 'cart_repo_impl_test.mocks.dart';

void main(){

  late CartRepoImpl repo;
  late ApiService apiService;

  setUp((){
    repo = MockCartRepoImpl();
    apiService = MockApiService();
  });

  test('getCart', () async {
    when(repo.getCart(1)).thenAnswer((_) async => CartModel(
        id: 1,
        userId: 3,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]));
    final result = await repo.getCart(1);
    expect(result, CartModel(
        id: 1,
        userId: 3,
        date: DateTime(2020, 6, 3),
        products: const [ProductCartModel(productId: 1, quantity: 3)]));
  });

  test('getCart from mock rest api', () async {
    when(apiService.getCart(1)).thenAnswer((_) async => CartEntity(id: 2, userId: 5, date: DateTime(2020,6,2), products: const [ProductCartEntity(productId: 1, quantity: 3)]));
    final result = await apiService.getCart(1);
    expect(result, CartEntity(id: 2, userId: 5, date: DateTime(2020,6,2), products: const [ProductCartEntity(productId: 1, quantity: 3)]));
  });

}