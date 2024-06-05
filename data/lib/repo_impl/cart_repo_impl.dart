import 'package:data/api_service.dart';
import 'package:data/entity/cart_entity.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/repo/cart_repo.dart';
class CartRepoImpl implements CartRepo{
  final ApiService _apiService;
  CartRepoImpl(this._apiService);
  @override
  Future<CartModel> getCart(int userId) async{
    return (await _apiService.getCart(userId)).toModel();
  }
}