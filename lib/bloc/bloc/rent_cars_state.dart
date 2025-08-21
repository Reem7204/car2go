part of 'rent_cars_bloc.dart';

@immutable
sealed class RentCarsState {}

final class RentCarsInitial extends RentCarsState {}
class RentCarBlocLoading extends RentCarsState {}
class RentCarBlocLoaded extends RentCarsState {}
class RentCarBlocError extends RentCarsState {}