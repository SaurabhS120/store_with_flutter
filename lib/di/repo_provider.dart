import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/repo/products_repo.dart';
import 'package:data/repo_impl/products_repo_impl.dart';
import 'package:data/api_service.dart';

final List<RepositoryProvider> repositoryProvider = [
  RepositoryProvider<ApiService>(
    create: (context) => ApiService.create(),
  ),
  RepositoryProvider<ProductsRepo>(
    create: (context) => ProductsRepoImpl(RepositoryProvider.of<ApiService>(context),),
  ),
];