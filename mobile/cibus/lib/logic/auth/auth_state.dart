import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class InitialAuthenticationState extends AuthState {}

class UnintializedState extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class StartRegistrationState extends AuthState {}

class Loading extends AuthState {}

