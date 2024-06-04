import 'package:domain/repo/products_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:domain/usecase/get_products_usecase.dart';

@GenerateNiceMocks([MockSpec<ProductsRepo>(),MockSpec<GetProductsUsecase>()])
import 'get_products_usecase_test.mocks.dart';

void main(){
  group("get product usecase test", (){
    late GetProductsUsecase usecase;
    late ProductsRepo repo;

    setUp((){
      repo = MockProductsRepo();
      usecase = GetProductsUsecase(repo);
    });

    test('getProducts usecase to repo call', () async {
      when(repo.getProducts()).thenAnswer((_) async => []);
      final result = await usecase.execute();
      expect(result, []);
      verify(repo.getProducts()).called(1);
    });
  });
}