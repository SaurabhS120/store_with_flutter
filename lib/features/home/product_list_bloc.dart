import 'package:domain/model/product_model.dart';
import 'package:domain/usecase/get_products_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListBloc extends Bloc<ProductListBlocEvent, ProductListBlocState>{


  ProductListBloc(GetProductsUsecase getProductsUsecase) : super(ProductListBlocLoading()){
    on<ProductListBlocEvent>((event, emit) async {
      if(event is FetchProductList){
        emit(ProductListBlocLoading());
        final products = await getProductsUsecase.execute();
        emit(ProductListBlocLoaded(products));
      }
    });
    add(FetchProductList());
  }
}
abstract class ProductListBlocEvent{

}
class FetchProductList extends ProductListBlocEvent{

}
abstract class ProductListBlocState extends Equatable{

}
class ProductListBlocLoading extends ProductListBlocState{
  @override
  List<Object?> get props => [];
}
class ProductListBlocLoaded extends ProductListBlocState {
  final List<ProductModel> products;

  ProductListBlocLoaded(this.products);

  @override
  List<Object?> get props => [products];
}