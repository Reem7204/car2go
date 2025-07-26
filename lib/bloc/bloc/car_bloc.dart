import 'package:bloc/bloc.dart';
import 'package:car2go/model/carModel.dart';
import 'package:car2go/repositories/car_repository.dart';
import 'package:meta/meta.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  late MapModel carModel;
  CarRepository carRepository = CarRepository();
  CarBloc() : super(CarInitial()) {
    on<FetchCarEvent>((event, emit) async {
      emit(CarBlocLoading());
      try {
        carModel = await carRepository.getCarDetails();
        emit(CarBlocLoaded());
      } catch (e) {
        emit(CarBlocError());
      }
    });
  }
}
