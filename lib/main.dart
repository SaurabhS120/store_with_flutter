import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/app_navigator.dart';
import 'package:store_with_flutter/di/bloc_provider.dart';
import 'package:store_with_flutter/di/repo_provider.dart';
import 'package:store_with_flutter/di/usecase_provider.dart';
import 'package:store_with_flutter/navigation_bloc.dart';

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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Profile Screen')
    );
  }
}