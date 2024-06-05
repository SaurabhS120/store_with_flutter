import 'package:domain/model/cart_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("ProductCartModel model equality test", (){
    test("equality", (){
      const ProductCartModel productCartModel = ProductCartModel(productId: 1, quantity: 1);
      expect(productCartModel, const ProductCartModel(productId: 1, quantity: 1));
    });
  });
  group("CartModel equality test", (){
    test("equality", (){
      final CartModel cartModel = CartModel(id: 1, userId: 1, date: DateTime(2020, 3, 2), products: const []);
      expect(cartModel, CartModel(id: 1, userId: 1, date: DateTime(2020, 3, 2), products: const []));
    });
  });
}