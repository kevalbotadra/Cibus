import 'package:cibus/data/firebase_functions.dart';
import 'package:cibus/data/models/donation.dart';
import 'package:cibus/data/models/user.dart';
import 'package:cibus/data/providers/account_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountRepository {
  final AccountProvider _accountProvider;

  AccountRepository({
    required AccountProvider accountProvider,
  }) : _accountProvider = accountProvider;

  Future<CibusUser> getCurrentCibusUser() async {
    // get the current user information
    DocumentSnapshot snapshot = await _accountProvider.getCurrentUserSnapshot();

    List<Map<String, dynamic>> postMaps =
        await _accountProvider.getCurrentUserPosts();

    List<Donation> donations = [];

    for (Map<String, dynamic> post in postMaps) {
      donations.add(Donation.fromMap(post));
    }

    return CibusUser.fullFromSnapshot(snapshot, donations);
  }
}
