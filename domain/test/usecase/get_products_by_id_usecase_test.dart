import 'package:domain/model/product_model.dart';
import 'package:domain/repo/products_repo.dart';
import 'package:domain/usecase/get_product_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<ProductsRepo>(),MockSpec<GetProductByIdUsecase>()])
import 'get_products_by_id_usecase_test.mocks.dart';

void main(){

  late GetProductByIdUsecase usecase;
  late MockGetProductByIdUsecase mockUsecase;
  late MockProductsRepo repo;
  const requestModel = ProductModel(id: 4, title: 'test', price: 500, description: 'test desc', category: 'category', image: 'img', rating: RatingModel(rate: 4.5, count: 100));
  const responseModel = ProductModel(id: 4, title: 'test', price: 500, description: 'test desc', category: 'category', image: 'img', rating: RatingModel(rate: 4.5, count: 100));

  setUp((){
    repo = MockProductsRepo();
    usecase = GetProductByIdUsecase(repo);
    mockUsecase = MockGetProductByIdUsecase();
  });

  test('getCart', () async {
    when(mockUsecase.execute(any)).thenAnswer((_) async => requestModel);
    final result = await mockUsecase.execute(GetProductsByIdUsecaseParams(1));
    expect(result, responseModel);
  });

  test('Get cart usecase test with dummy response', (){
    const ProductModel requestModel = ProductModel(id: 1, title: 'test', price: 500, description: 'test desc', category: 'category', image: 'img', rating: RatingModel(rate: 4.5, count: 100));
    const ProductModel responseModel = ProductModel(id: 1, title: 'test', price: 500, description: 'test desc', category: 'category', image: 'img', rating: RatingModel(rate: 4.5, count: 100));
    when(repo.getProductsById(any)).thenAnswer((_) async => requestModel);
    expect(usecase.execute(GetProductsByIdUsecaseParams(1)), completion(responseModel));
  });

}