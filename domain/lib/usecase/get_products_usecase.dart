import 'package:domain/model/product_model.dart';
import 'package:domain/repo/products_repo.dart';
class GetProductsUsecase {
  final ProductsRepo productsRepository;

  GetProductsUsecase(this.productsRepository);

  Future<List<ProductModel>> execute() {
    return productsRepository.getProducts();
  }
}