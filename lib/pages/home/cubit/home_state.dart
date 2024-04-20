part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<LocalModel>? locais;

  HomeLoaded({required this.locais});
}

final class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}
