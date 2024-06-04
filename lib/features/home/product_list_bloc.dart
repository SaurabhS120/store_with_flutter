import 'package:domain/model/product_model.dart';
import 'package:domain/usecase/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListBloc extends Bloc<ProductListBlocEvent, ProductListBlocState>{


  ProductListBloc(GetProductsUsecase _getProductsUsecase) : super(ProductListBlocLoading()){
    on<ProductListBlocEvent>((event, emit) async {
      if(event is FetchProductList){
        emit(ProductListBlocLoading());
        final products = await _getProductsUsecase.execute();
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
abstract class ProductListBlocState{

}
class ProductListBlocLoading extends ProductListBlocState{}
class ProductListBlocLoaded extends ProductListBlocState{
  final List<ProductModel> products;
  ProductListBlocLoaded(this.products);
}