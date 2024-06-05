import 'package:data/entity/cart_entity.dart';
import 'package:data/entity/product_entity.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://fakestoreapi.com')
abstract class ApiService {
  factory ApiService(Dio dio,){
    return _ApiService(dio,);
  }
  
  factory ApiService.create() => ApiService(Dio()..interceptors.addAll([PrettyDioLogger()]));
  
  @GET('/products')
  Future<List<ProductEntity>> getProducts();

  @GET('/cart/{userId}')
  Future<List<CartEntity>> getCart(@Path('userId') int userId);
}