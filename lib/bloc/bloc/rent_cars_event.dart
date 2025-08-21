part of 'rent_cars_bloc.dart';

@immutable
sealed class RentCarsEvent {}
class FetchRentCarEvent extends RentCarsEvent {}