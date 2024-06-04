import 'package:data/api_service.dart';
import 'package:data/repo_impl/products_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ApiService>(),MockSpec<ProductsRepoImpl>()])
import 'product_repo_impl_test.mocks.dart';

void main(){
  late ProductsRepoImpl repo;
  late ApiService apiService;

  setUp((){
    repo = MockProductsRepoImpl();
    apiService = MockApiService();
  });

  test('getProducts', () async {
    when(repo.getProducts()).thenAnswer((_) async => []);
    final result = await repo.getProducts();
    expect(result, []);
  });

  test('getProducts from mock rest api', () async {
    when(apiService.getProducts()).thenAnswer((_) async => []);
    final result = await apiService.getProducts();
    expect(result, []);
  });
}