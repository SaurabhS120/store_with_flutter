import 'package:domain/model/cart_model.dart';
import 'package:domain/model/product_model.dart';
import 'package:domain/usecase/get_cart_usecase.dart';
import 'package:domain/usecase/get_product_by_id_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState>{
  CartModel? cartItems;
  bool loadingCart = false;
  List<ProductModel> products = const [];
  int loadIndex = 0;


  CartBloc(GetCartUseCase getCartUseCase,GetProductByIdUsecase getProductByIdUsecase) : super(CartBlocLoading()){
    on<FetchCart>((event, emit) async {
      emit(CartBlocLoading());
      CartModel cartItemsResponse = await getCartUseCase.execute(GetCartUsecaseParam(1));
      cartItems = cartItemsResponse;
      loadIndex = 0;
      products = [];
      emit(CartBlocLoaded(cartItems:cartItemsResponse, loadingCart: cartItemsResponse.products.isNotEmpty, products: const [], ));
      if(cartItemsResponse.products.isNotEmpty) {
        loadingCart = true;
        add(LoadProductEvent(index: loadIndex));
      }
    });
    on<LoadProductEvent>((event, emit) async {
      ProductModel response = await getProductByIdUsecase.execute(GetProductsByIdUsecaseParams(cartItems?.products[loadIndex].productId??1));
      products = ProductModel.copyList(products)..add(response);
      if(loadIndex < cartItems!.products.length-1) {
        loadingCart = true;
      } else {
        loadingCart = false;
      }
      emit(CartBlocLoaded(cartItems:cartItems!, loadingCart: loadingCart, products: products));
      if(loadingCart){
        loadIndex++;
        add(LoadProductEvent(index: loadIndex));
      }
    });
    add(FetchCart());
  }
}
abstract class CartBlocEvent{

}
class FetchCart extends CartBlocEvent{

}
class LoadProductEvent extends CartBlocEvent{
  final int index;

  LoadProductEvent({required this.index});
}
abstract class CartBlocState extends Equatable{

}
class CartBlocLoading extends CartBlocState{
  @override
  List<Object?> get props => [];
}
class CartBlocLoaded extends CartBlocState {
  final CartModel cartItems;
  final bool loadingCart;
  final List<ProductModel> products;
  final int loadIndex = 0;

  CartBlocLoaded({required this.cartItems,required this.loadingCart,required this.products});

  @override
  List<Object?> get props => [cartItems, loadingCart,products];
}