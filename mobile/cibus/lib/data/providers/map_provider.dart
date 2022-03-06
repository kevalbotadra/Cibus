import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart';

class MapProvider {
  final client = Client();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<List<Map<String, dynamic>>> getDontaions() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection("posts").get();

    List<Map<String, dynamic>> donations = [];
    querySnapshot.docs.forEach((donation) {
      donations.add(donation.data());
    });

    return donations;
  }
}
