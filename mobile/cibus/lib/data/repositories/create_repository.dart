import 'dart:io';

import 'package:cibus/data/models/user.dart';
import 'package:cibus/data/providers/create_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cibus/data/firebase_functions.dart';

class CreateRepository {
  final CreateProvider _createProvider;

  CreateRepository({
    required CreateProvider createProvider,
  }) : _createProvider = createProvider;

  Future<void> createPost({
    required String title,
    required String body,
    required File image,
    required String location,
    required double weight,
  }) async {
    CibusUser currentUser = await getCurrentUserFromFirebaseUser(
            FirebaseAuth.instance.currentUser);

    await _createProvider.createDonation(
        title: title,
        body: body,
        image: image,
        location: location,
        createdAt: Timestamp.now(),
        creator: currentUser,
        weight: weight);
  }
}
