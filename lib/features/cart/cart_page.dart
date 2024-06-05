import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/features/cart/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartBlocState>(
      builder: (context, state) {
        if (state is CartBlocLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartBlocLoaded) {
          return ListView.builder(
            itemCount: state.cartItems.products.length,
            itemBuilder: (context, index) {
              final cartItem = state.cartItems.products[index];
              return ListTile(
                title: Text(cartItem.productId.toString()),
                subtitle: Text(cartItem.quantity.toString()),
              );
            },
          );
        } else {
          return const Center(child: Text('Failed to load cart'));
        }
      },
    );
  }
}
