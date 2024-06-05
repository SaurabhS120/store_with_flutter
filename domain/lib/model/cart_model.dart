
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
}
