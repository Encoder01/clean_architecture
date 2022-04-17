part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
      AuthInitial();
}

class AuthLoading extends AuthState {
  AuthLoading();
}

class AuthSignInSuccesfull extends AuthState {
  User user;
  AuthSignInSuccesfull(this.user);
}

class AuthSignUp extends AuthState {
  User user;
  AuthSignUp(this.user);
}

class AuthSignOut extends AuthState {
  AuthSignOut();
}
