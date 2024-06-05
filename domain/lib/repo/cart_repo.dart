import 'package:domain/model/cart_model.dart';

abstract class CartRepo {
  Future<CartModel> getCart(int userId);
}