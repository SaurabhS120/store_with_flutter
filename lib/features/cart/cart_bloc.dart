import 'package:domain/model/cart_model.dart';
import 'package:domain/usecase/get_cart_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState>{


  CartBloc(GetCartUseCase getCartUseCase) : super(CartBlocLoading()){
    on<CartBlocEvent>((event, emit) async {
      if(event is FetchCart){
        emit(CartBlocLoading());
        CartModel products = await getCartUseCase.execute(GetCartUsecaseParam(1));
        emit(CartBlocLoaded(products));
      }
    });
    add(FetchCart());
  }
}
abstract class CartBlocEvent{

}
class FetchCart extends CartBlocEvent{

}
abstract class CartBlocState extends Equatable{

}
class CartBlocLoading extends CartBlocState{
  @override
  List<Object?> get props => [];
}
class CartBlocLoaded extends CartBlocState {
  final CartModel cartItems;

  CartBlocLoaded(this.cartItems);

  @override
  List<Object?> get props => [cartItems];
}