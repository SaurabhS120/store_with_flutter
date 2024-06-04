import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/di/bloc_provider.dart';
import 'package:store_with_flutter/di/repo_provider.dart';
import 'package:store_with_flutter/di/usecase_provider.dart';
import 'package:store_with_flutter/navigation_bloc.dart';
import 'package:store_with_flutter/product_list_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: repositoryProvider,
        child: MultiRepositoryProvider(
          providers: usecaseProviders,
          child: MultiBlocProvider(
            providers: blocProviders,
            child: BlocProvider(
              create: (context) => NavigationBloc(),
              child: const AppNavigator(),
            ),
          ),
        ),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is HomeScreenState) {
          return const HomeScreen();
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    return ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.products[index].title),
                          subtitle: Text(state.products[index].price.toString()),
                        );
                      },
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<NavigationBloc>().add(NavigateToHome());
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<NavigationBloc>().add(NavigateToHome());
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
