import 'package:data/api_service.dart';
import 'package:data/entity/product_entity.dart';
import 'package:domain/model/product_model.dart';
import 'package:domain/repo/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {

  final ApiService _apiService;

  ProductsRepoImpl(this._apiService);

  @override
  Future<List<ProductModel>> getProducts() async {
    final products = await _apiService.getProducts();
    return products.map((e) => e.toModel()).toList();
  }
}