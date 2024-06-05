import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';
import 'package:store_with_flutter/navigation_bloc.dart';


class ProductListPage extends StatelessWidget{
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<NavigationBloc>().add(NavigateToProfile());
          },
          child: const Text('Go to Profile'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<NavigationBloc>().add(NavigateToCart());
          },
          child: const Text('Go to Cart'),
        ),
        Expanded(child:
        BlocBuilder<ProductListBloc, ProductListBlocState>(
          builder: (context, state) {
            if (state is ProductListBlocLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductListBlocLoaded) {
              return ColoredBox(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: GridView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return AspectRatio(
                        aspectRatio: 1,
                        child: ColoredBox (
                          color: Colors.white,
                          child: Column(
                            children: [
                              Expanded(child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(state.products[index].image,fit: BoxFit.contain,),
                              )),
                              Text(state.products[index].title,textAlign: TextAlign.center,),
                              Text(state.products[index].price.toString(),textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      );
                    }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
                  ),
                ),
              );
            }
            return Container();
          },
        ),
        ),
      ],
    );
  }
}