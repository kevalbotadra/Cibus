import 'dart:io';
import 'package:cibus/data/firebase_functions.dart';
import 'package:cibus/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class CreateProvider {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createDonation({
    required String title,
    required String body,
    required File image,
    required String location,
    required Timestamp createdAt,
    required CibusUser creator,
    required double weight,
  }) async {
    String imageUrl = await uploadImageToFirebase(image);

    List<Location> locations = await locationFromAddress(location);


    DocumentReference<Map<String, dynamic>> doc =
        await firestore.collection("posts").add({
      "title": title,
      "body": body,
      "imgUrl": imageUrl,
      "location": GeoPoint(locations[0].latitude, locations[0].longitude),
      "createdAt": createdAt,
      "creator": creator.userToMap(),
      "weight": weight,
    });

    doc.set({
      "uid": doc.id,
    }, SetOptions(merge : true));
  }
}
