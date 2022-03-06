import 'package:cibus/data/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object> get props => [];
}

class LoggedIn extends AuthEvent {}

class LoggedOut extends AuthEvent {}

class SubmitSignUp extends AuthEvent {
  final String name;
  final String orgName;
  final String? orgType;

  SubmitSignUp({required this.name, required this.orgName, required this.orgType});

  @override
  List<Object> get props => [name, orgName];
}
