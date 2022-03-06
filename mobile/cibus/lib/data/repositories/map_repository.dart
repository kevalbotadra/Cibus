import 'package:cibus/data/models/donation.dart';
import 'package:cibus/data/providers/map_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapRepository {
  MapProvider _mapProvider;

  MapRepository({
    required MapProvider mapProvider,
  }) : _mapProvider = mapProvider;

  Future<Position> getUserLocation() async {
    return await _mapProvider.determinePosition();
  }

  Future<List<Donation>> getDonations() async {
    List<Map<String, dynamic>> donationMaps =
        await _mapProvider.getDontaions();
    List<Donation> donations = [];

    for (Map<String, dynamic> donationMap in donationMaps) {
      Donation donation = Donation.fromMap(donationMap);

      List<Placemark> placemarks =
          await placemarkFromCoordinates(donation.lat, donation.long);
      Placemark place = placemarks[0];
      donation.setAddress(
          place);
      donations.add(donation);
    }
    return donations;
  }
}
