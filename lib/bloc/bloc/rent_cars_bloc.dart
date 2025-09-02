import 'package:bloc/bloc.dart';
import 'package:car2go/model/carModel.dart';
import 'package:car2go/repositories/car_repository.dart';
import 'package:meta/meta.dart';

part 'rent_cars_event.dart';
part 'rent_cars_state.dart';

class RentCarsBloc extends Bloc<RentCarsEvent, RentCarsState> {
  late List<MapModel> rentModel;
  CarRepository carRepository = CarRepository();
  RentCarsBloc() : super(RentCarsInitial()) {
    on<FetchRentCarEvent>((event, emit) async {
      print('00000000000000000000');
      emit(RentCarBlocLoading());
      try {
        print('111111111111111');
        rentModel = await carRepository.getBuyCarDetails();
        emit(RentCarBlocLoaded());
      } catch (e) {
        emit(RentCarBlocError());
      }
    });
  }

}
