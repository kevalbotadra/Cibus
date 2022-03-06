import 'package:cibus/data/models/donation.dart';
import 'package:cibus/data/providers/feed_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class FeedRepository {
  final FeedProvider _feedProvider;

  FeedRepository({
    required FeedProvider feedProvider,
  }) : _feedProvider = feedProvider;

  Future<List<Donation>> getDonations() async {
    List<Map<String, dynamic>> donationMaps =
        await _feedProvider.getDontaions();
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
