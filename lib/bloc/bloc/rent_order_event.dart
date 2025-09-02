part of 'rent_order_bloc.dart';

@immutable
sealed class RentOrderEvent {}
class FetchRentOrderEvent extends RentOrderEvent {
  final String vehicle;
  final String user;
  final String pickupDate;
  final String returnDate;
  final String pickupLocation;
  final String returnLocation;
  final int amount;
  FetchRentOrderEvent({required this.vehicle, required this.user, required this.pickupDate, required this.returnDate, required this.pickupLocation, required this.returnLocation, required this.amount, });
}