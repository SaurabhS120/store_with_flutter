import 'package:domain/model/product_model.dart';
import 'package:domain/repo/products_repo.dart';
class GetProductByIdUsecase {
  final ProductsRepo productsRepository;

  GetProductByIdUsecase(this.productsRepository);

  Future<ProductModel> execute(GetProductsByIdUsecaseParams params){
    return productsRepository.getProductsById(params.id);
  }
}
class GetProductsByIdUsecaseParams {
  final int id;

  GetProductsByIdUsecaseParams(this.id);
}