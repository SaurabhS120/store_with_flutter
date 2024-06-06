import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/app_colors.dart';
import 'package:store_with_flutter/features/cart/cart_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart',style: TextStyle(color: AppColors.appBarTitleColor),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: BlocBuilder<CartBloc, CartBlocState>(
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
                  return ProductCartItem(product: product, cartItem: cartItem);
                },
              ),
            );
          } else {
            return const Center(child: Text('Failed to load cart'));
          }
        },
      ),
    );
  }
}

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    super.key,
    required this.product,
    required this.cartItem,
  });

  final ProductModel? product;
  final ProductCartModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if(product!=null) Padding(padding: const EdgeInsets.all(8),
        child: CachedNetworkImage(
          imageUrl:product?.image??'',width: 100,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
        )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (product != null)
                Text(
                  product?.title ?? '',
                  style: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
              Row(
                key:const Key('Quantity Row'),
                children: [
                  Text(
                    "Quantity: ",
                    style: DefaultTextStyle.of(context).style.copyWith(color: Colors.black54),
                  ),
                  Text(
                    cartItem.quantity.toString(),
                    style: DefaultTextStyle.of(context).style.copyWith(color: Colors.black38, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
