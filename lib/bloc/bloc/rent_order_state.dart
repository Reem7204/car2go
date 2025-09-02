part of 'rent_order_bloc.dart';

@immutable
sealed class RentOrderState {}

final class RentOrderInitial extends RentOrderState {}
class RentOrderBlocLoading extends RentOrderState {}
class RentOrderBlocLoaded extends RentOrderState {}
class RentOrderBlocError extends RentOrderState {}