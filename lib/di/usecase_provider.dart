import 'package:domain/repo/products_repo.dart';
import 'package:domain/usecase/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> usecaseProviders = [
  RepositoryProvider<GetProductsUsecase>(
    create: (context) => GetProductsUsecase(RepositoryProvider.of<ProductsRepo>(context)),
  ),
];