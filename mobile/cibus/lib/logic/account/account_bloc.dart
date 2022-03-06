import 'package:cibus/data/models/user.dart';
import 'package:cibus/data/repositories/account_repository.dart';
import 'package:cibus/logic/account/account_event.dart';
import 'package:cibus/logic/account/account_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository _accountRepository;

  AccountBloc(AccountRepository accountRepository)
      : _accountRepository = accountRepository,
        super(InitalAccountState());

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is GetAccount) {
      CibusUser currentUser = await _accountRepository.getCurrentCibusUser();
      yield AccountObtained(user: currentUser);
    }
  }
}
