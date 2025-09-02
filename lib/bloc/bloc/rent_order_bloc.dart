import 'package:bloc/bloc.dart';
import 'package:car2go/model/rentOrder.dart';
import 'package:car2go/repositories/car_repository.dart';
import 'package:meta/meta.dart';

part 'rent_order_event.dart';
part 'rent_order_state.dart';

class RentOrderBloc extends Bloc<RentOrderEvent, RentOrderState> {
  late RentOrder rentOrder;
  CarRepository carRepository = CarRepository();
  RentOrderBloc() : super(RentOrderInitial()) {
    on<FetchRentOrderEvent>((event, emit) async {
      emit(RentOrderBlocLoading());
      try {
        rentOrder = await carRepository.postCreateRentOrder(event.vehicle,event.user,event.pickupDate,event.returnDate,event.pickupLocation,event.returnLocation,event.amount);
        emit(RentOrderBlocLoaded());
      } catch (e) {
        emit(RentOrderBlocError());
      }
    });
  }
}
