import 'package:domain/model/cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  group("ProductCartModel model equality test", (){
    const ProductCartModel productCartModel = ProductCartModel(productId: 1, quantity: 1);
    test("Subclass of Equatable", (){
      expect(productCartModel, isA<Equatable>());
    });
    test("equality", (){
      expect(productCartModel, const ProductCartModel(productId: 1, quantity: 1));
    });
  });
  group("CartModel equality test", (){
    final CartModel cartModel = CartModel(id: 1, userId: 1, date: DateTime(2020, 3, 2), products: const []);
    test("Subclass of Equatable", (){
      expect(cartModel, isA<Equatable>());
    });
    test("equality", (){
      expect(cartModel, CartModel(id: 1, userId: 1, date: DateTime(2020, 3, 2), products: const []));
    });
  });
}