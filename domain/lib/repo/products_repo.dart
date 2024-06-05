import 'package:domain/model/product_model.dart';
abstract class ProductsRepo {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProductsById(int id);
}