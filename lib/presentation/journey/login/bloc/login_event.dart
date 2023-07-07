part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class StartLogin extends LoginEvent {

  final String email;

  final String password;

  StartLogin({required this.email, required this.password});
}
