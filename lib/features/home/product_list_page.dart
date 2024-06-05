import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';


class ProductListPage extends StatelessWidget{
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    return AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5F2FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Expanded(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CachedNetworkImage(
                                imageUrl:state.products[index].image,fit: BoxFit.contain,
                                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                              ),
                            )),
                            Text(state.products[index].title,textAlign: TextAlign.center,),
                            Text(state.products[index].price.toString(),textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    );
                  }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}