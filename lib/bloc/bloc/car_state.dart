part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitial extends CarState {}
class CarBlocLoading extends CarState {}
class CarBlocLoaded extends CarState {}
class CarBlocError extends CarState {}
