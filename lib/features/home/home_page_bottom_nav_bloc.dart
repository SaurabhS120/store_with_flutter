import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBottomNavBloc  extends Bloc<HomePageBottomNavEvent, HomePageBottomNavState>{

  HomePageBottomNavBloc() : super(HomePageBottomNavProductListState()){

    on<HomePageBottomNavProductListEvent>((event, emit) {
      emit(HomePageBottomNavProductListState());
    });

    on<HomePageBottomNavCartEvent>((event, emit) {
      emit(HomePageBottomNavCartState());
    });

    on<HomePageBottomNavProfileEvent>((event, emit) {
      emit(HomePageBottomNavProfileState());
    });

  }

  void onBottomNavTap(int index) async{
    switch(index){
      case 0:
        // Navigate to Home
        add(HomePageBottomNavProductListEvent());
        break;
      case 1:
        // Navigate to Cart
        add(HomePageBottomNavCartEvent());
        break;
      case 2:
        // Navigate to Profile
        add(HomePageBottomNavProfileEvent());
        break;
    }
  }

}
//--------------------- Events ---------------------
abstract class HomePageBottomNavEvent extends Equatable {
  const HomePageBottomNavEvent();
}
//Possible Event list
class HomePageBottomNavProductListEvent extends HomePageBottomNavEvent {
  @override
  List<Object> get props => [];
}
class HomePageBottomNavCartEvent extends HomePageBottomNavEvent {
  @override
  List<Object> get props => [];
}
class HomePageBottomNavProfileEvent extends HomePageBottomNavEvent {
  @override
  List<Object> get props => [];
}
//--------------------- Events ---------------------

//--------------------- States ---------------------
abstract class HomePageBottomNavState extends Equatable {
  final int index;
  HomePageBottomNavState(this.index);
}
//Possible State list
class HomePageBottomNavProductListState extends HomePageBottomNavState {
  HomePageBottomNavProductListState() : super(0);

  @override
  List<Object> get props => [];
}
class HomePageBottomNavCartState extends HomePageBottomNavState {
  HomePageBottomNavCartState():super(1);

  @override
  List<Object> get props => [];
}
class HomePageBottomNavProfileState extends HomePageBottomNavState {
  HomePageBottomNavProfileState():super(2);

  @override
  List<Object> get props => [];
}
//--------------------- States ---------------------