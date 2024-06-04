import 'package:domain/usecase/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_with_flutter/features/home/product_list_bloc.dart';
final List<BlocProvider> blocProviders = [
  BlocProvider<ProductListBloc>(
    create: (context) => ProductListBloc(RepositoryProvider.of<GetProductsUsecase>(context)),
  ),
];