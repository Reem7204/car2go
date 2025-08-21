import 'package:bloc/bloc.dart';
import 'package:car2go/model/signUpModel.dart';
import 'package:car2go/repositories/car_repository.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  late SignUpModel signUpModel;
  CarRepository carRepository = CarRepository();
  SignupBloc() : super(SignupInitial()) {
    on<FetchSignupEvent>((event, emit) async {
      emit(SignupStateLoading());
      try {
        signUpModel = await carRepository.signUp(event.fullName, event.email, event.phone, event.password);
        emit(SignupStateLoaded('SignUp Successfully', signUpModel));
      } catch (e) {
        emit(SignupStateError(e.toString().replaceFirst('Exception: ', '')));
      }
    });
  }
}
