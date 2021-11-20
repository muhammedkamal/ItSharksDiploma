part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthUsingEmailAndPassword extends AuthEvent {
  final String email, pass;

  const AuthUsingEmailAndPassword(this.email, this.pass);
  @override
  List<Object> get props => [email, pass];
}

class RegisterUsingEmailAndPassword extends AuthEvent {
  final String email, pass;

  const RegisterUsingEmailAndPassword(this.email, this.pass);
  @override
  List<Object> get props => [email, pass];
}
