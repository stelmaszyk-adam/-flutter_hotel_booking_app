part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitState extends HomeState {
  const HomeInitState();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState({required this.hotels, required this.favor});

  final HotelListEntity hotels;
  final List<String> favor;

  @override
  List<Object?> get props => [hotels, favor];
}

class HomeFailureState extends HomeState {
  const HomeFailureState({required this.failure});

  final HotelsException failure;

  @override
  List<Object?> get props => [failure];
}
