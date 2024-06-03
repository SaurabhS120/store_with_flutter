// navigation_event.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateToHome extends NavigationEvent {}
class NavigateToProfile extends NavigationEvent {}
class NavigateToSettings extends NavigationEvent {}

// navigation_state.dart
abstract class NavigationState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeScreenState extends NavigationState {}
class ProfileScreenState extends NavigationState {}
class SettingsScreenState extends NavigationState {}

// navigation_bloc.dart
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeScreenState()) {
    on<NavigateToHome>((event, emit) {
      emit(HomeScreenState());
    });
    on<NavigateToProfile>((event, emit) {
      emit(ProfileScreenState());
    });
    on<NavigateToSettings>((event, emit) {
      emit(SettingsScreenState());
    });
  }
}
