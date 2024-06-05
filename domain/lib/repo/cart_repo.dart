import 'package:domain/model/cart_model.dart';

abstract class CartRepo {
  Future<List<CartModel>> getCart(int userId);
}