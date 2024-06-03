import 'package:data/entity/product_entity.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio,{required baseUrl}){
    return _ApiService(dio,baseUrl: baseUrl);
  }
  @GET('/products')
  Future<List<ProductEntity>> getProducts();
}