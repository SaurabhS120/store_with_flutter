import 'package:data/api_service.dart';
import 'package:data/entity/product_entity.dart';
import 'package:data/repo_impl/products_repo_impl.dart';
import 'package:domain/model/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ApiService>(),MockSpec<ProductsRepoImpl>()])
import 'product_repo_impl_test.mocks.dart';

void main(){
  late MockProductsRepoImpl repo;
  late MockApiService apiService;

  setUp((){
    repo = MockProductsRepoImpl();
    apiService = MockApiService();
  });

  group("getProducts api", (){
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
  });

  group("getProductById", (){
    test('repo test', () async {
      when(repo.getProductsById(any)).thenAnswer((_) async => const ProductModel(
        id: 1,
        title: "title",
        price: 1.0,
        description: "description",
        category: "category",
        image: "image",
        rating: RatingModel(rate: 1.0, count: 1),
      ));
      final result = await repo.getProducts();
      expect(result, []);
    });

    test('repo test from mock rest api', () async {
      when(apiService.getProductsById(any)).thenAnswer((_) async => const ProductEntity(
        id: 1,
        title: "title",
        price: 1.0,
        description: "description",
        category: "category",
        image: "image",
        rating: RatingEntity(rate: 1.0, count: 1),
      ));
      final result = await apiService.getProducts();
      expect(result, const ProductEntity(
        id: 1,
        title: "title",
        price: 1.0,
        description: "description",
        category: "category",
        image: "image",
        rating: RatingEntity(rate: 1.0, count: 1),
      ));
    });
  });
}