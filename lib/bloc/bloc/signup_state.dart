part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}
class SignupStateLoading extends SignupState {}
class SignupStateLoaded extends SignupState {
  final String message;
  final SignUpModel user;

  SignupStateLoaded(this.message, this.user);
}
class SignupStateError extends SignupState {
  final String message;
  SignupStateError(this.message);
}
