import 'package:domain/repo/cart_repo.dart';
import 'package:domain/repo/products_repo.dart';
import 'package:domain/usecase/get_cart_usecase.dart';
import 'package:domain/usecase/get_product_by_id_usecase.dart';
import 'package:domain/usecase/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider> usecaseProviders = [
  RepositoryProvider<GetProductsUsecase>(
    create: (context) => GetProductsUsecase(RepositoryProvider.of<ProductsRepo>(context)),
  ),
  RepositoryProvider<GetCartUseCase>(
    create: (context) => GetCartUseCase(RepositoryProvider.of<CartRepo>(context)),
  ),
  RepositoryProvider<GetProductByIdUsecase>(
    create: (context) => GetProductByIdUsecase(RepositoryProvider.of<ProductsRepo>(context)),
  ),
];