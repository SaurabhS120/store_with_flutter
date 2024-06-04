import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/di/bloc_provider.dart';
import 'package:store_with_flutter/di/repo_provider.dart';
import 'package:store_with_flutter/di/usecase_provider.dart';
import 'package:store_with_flutter/features/home/home_page.dart';
import 'package:store_with_flutter/main.dart';
import 'package:store_with_flutter/navigation_bloc.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is HomeScreenState) {
          return const HomePage();
        } else if (state is ProfileScreenState) {
          return const ProfileScreen();
        } else if (state is SettingsScreenState) {
          return const SettingsScreen();
        }
        return Container();
      },
    );
  }
}