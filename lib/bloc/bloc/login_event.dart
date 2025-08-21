part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
class FetchLoginEvent extends LoginEvent {
  final String email;
  final String password;
  FetchLoginEvent({required this.email, required this.password,});
}