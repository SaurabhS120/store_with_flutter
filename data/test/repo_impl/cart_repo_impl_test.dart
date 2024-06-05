import 'package:data/api_service.dart';
import 'package:data/repo_impl/cart_repo_impl.dart';
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
    when(repo.getCart(1)).thenAnswer((_) async => []);
    final result = await repo.getCart(1);
    expect(result, []);
  });

  test('getCart from mock rest api', () async {
    when(apiService.getCart(1)).thenAnswer((_) async => []);
    final result = await apiService.getCart(1);
    expect(result, []);
  });

}