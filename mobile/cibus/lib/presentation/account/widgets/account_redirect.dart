import 'package:cibus/data/providers/account_provider.dart';
import 'package:cibus/data/repositories/account_repository.dart';
import 'package:cibus/logic/account/account_bloc.dart';
import 'package:cibus/logic/account/account_event.dart';
import 'package:cibus/presentation/account/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accountRepository = new AccountRepository(accountProvider: new AccountProvider());

    return Container(
      alignment: Alignment.center,
    child: BlocProvider<AccountBloc>(
        create: (context) => AccountBloc(accountRepository)..add(GetAccount()),
        child: AccountPage(),
      ),
    );
  }
}