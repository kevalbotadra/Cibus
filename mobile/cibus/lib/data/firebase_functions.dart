import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cibus/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<CibusUser> getCurrentUserFromFirebaseUser(User? user) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  if (user != null) {
    DocumentReference doc = users.doc(user.uid);
    DocumentSnapshot snapshot = await doc.get();
    CibusUser finalUser = CibusUser.lessFromSnapshot(snapshot);
    return finalUser;
  }

  return CibusUser(isValid: false);
}

Future<String> uploadImageToFirebase(File imageFile) async {
  Reference ref = FirebaseStorage.instance.ref(imageFile.path);
  await ref.putFile(
    imageFile,
  );
  return ref.getDownloadURL();
}