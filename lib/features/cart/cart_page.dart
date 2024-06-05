import 'package:domain/model/cart_model.dart';
import 'package:domain/model/product_model.dart';
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              itemCount: state.cartItems.products.length,
              separatorBuilder: (context, index) => const Divider(height: 8,),
              itemBuilder: (context, index) {
                final ProductCartModel cartItem = state.cartItems.products[index];
                final ProductModel? product = state.products.length>index?state.products[index]:null;
                return Row(
                  children: [
                    if(product!=null) Padding(padding: const EdgeInsets.all(8),
                    child: Image.network(product.image,width: 100,)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(product!=null) Text("Product: ${product.title}"),
                          Text("Quantity: ${cartItem.quantity}"),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(child: Text('Failed to load cart'));
        }
      },
    );
  }
}
