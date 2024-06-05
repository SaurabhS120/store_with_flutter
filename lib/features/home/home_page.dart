import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/features/home/home_page_bottom_nav_bloc.dart';
import 'package:store_with_flutter/features/home/product_list_page.dart';
import 'package:store_with_flutter/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBottomNavBloc, HomePageBottomNavState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Home')),
          body:_showPage(state),
          bottomNavigationBar: BottomNavigationBar(
          currentIndex: state.index,
          onTap: BlocProvider.of<HomePageBottomNavBloc>(context).onBottomNavTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
        )
        );
      },
    );
  }

  Widget _showPage(HomePageBottomNavState state) {
    if (state is HomePageBottomNavProductListState) {
      return const ProductListPage();
    } else if (state is HomePageBottomNavCartState) {
      return const Center(child: Text('Cart'));
    } else if (state is HomePageBottomNavProfileState) {
      return const ProfileScreen();
    }
    return Container();
  }
}