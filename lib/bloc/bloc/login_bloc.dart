import 'package:bloc/bloc.dart';
import 'package:car2go/model/loginModel.dart';
import 'package:car2go/repositories/car_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginModel loginModel;
  CarRepository carRepository = CarRepository();
  LoginBloc() : super(LoginInitial()) {
    on<FetchLoginEvent>((event, emit) async {
      emit(LoginStateLoading());
      try {
        loginModel = await carRepository.signIn(event.email, event.password);
        emit(LoginStateLoaded());
      } catch (e) {
        emit(LoginStateError('Invalid username or password'));
      }
    });
  }
}
