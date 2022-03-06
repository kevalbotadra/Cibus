import 'package:cibus/data/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class InitalAccountState extends AccountState {}

class AccountObtained extends AccountState {
  final CibusUser user;
  AccountObtained({required this.user});
}
