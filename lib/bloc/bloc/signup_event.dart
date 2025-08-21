part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}
class FetchSignupEvent extends SignupEvent {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  
  FetchSignupEvent({required this.fullName, required this.email, required this.phone, required this.password});
}