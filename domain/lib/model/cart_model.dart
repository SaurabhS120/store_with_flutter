
import 'package:equatable/equatable.dart';

class CartModel extends Equatable{
  final int id;
  final int userId;
  final DateTime date;
  final List<ProductCartModel> products;

  const CartModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  static CartModel copy(CartModel cartModel){
    return CartModel(id: cartModel.id, userId: cartModel.userId, date: cartModel.date, products: ProductCartModel.copy(cartModel.products));
  }

  @override
  List<Object?> get props => [id, userId, date, products];
}
class ProductCartModel extends Equatable{
  final int productId;
  final int quantity;

  const ProductCartModel({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];

  static List<ProductCartModel> copy(List<ProductCartModel> products){
    List<ProductCartModel> newProducts = [];
    for(ProductCartModel product in products){
      newProducts.add(ProductCartModel(productId: product.productId, quantity: product.quantity));
    }
    return newProducts;
  }
}
