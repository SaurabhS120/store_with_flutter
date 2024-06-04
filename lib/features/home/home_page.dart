import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/di/bloc_provider.dart';
import 'package:store_with_flutter/di/repo_provider.dart';
import 'package:store_with_flutter/di/usecase_provider.dart';
import 'package:store_with_flutter/navigation_bloc.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';
import 'package:store_with_flutter/app_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<NavigationBloc>().add(NavigateToProfile());
              },
              child: const Text('Go to Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<NavigationBloc>().add(NavigateToSettings());
              },
              child: const Text('Go to Settings'),
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
                                  Expanded(child: Image.network(state.products[index].image,fit: BoxFit.contain,)),
                                  Text(state.products[index].title),
                                  Text(state.products[index].price.toString()),
                                ],
                              ),
                            ),
                          );
                        }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}