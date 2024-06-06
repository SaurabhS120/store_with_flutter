import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/app_colors.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';


class ProductListPage extends StatelessWidget{
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping with flutter',style: TextStyle(color: AppColors.appBarTitleColor),
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: SafeArea(
        child: BlocBuilder<ProductListBloc, ProductListBlocState>(
          builder: (context, state) {
            if (state is ProductListBlocLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductListBlocLoaded) {
              return ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return ProductItem(product:  state.products[index],);
                    }, gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, crossAxisSpacing: 8, mainAxisSpacing: 8),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFE1DE),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                imageUrl:product.image,fit: BoxFit.contain,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
              ),
            )),
            Text(product.title,textAlign: TextAlign.center,style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),),
            Text(product.price.toString(),textAlign: TextAlign.center,style: TextStyle(color: Colors.black38),),
          ],
        ),
      ),
    );
  }
}