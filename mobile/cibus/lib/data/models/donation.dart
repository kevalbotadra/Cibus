import 'package:cibus/data/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';

class Donation {
  final String uniqueId;
  final String title;
  final String body;
  final String imageUrl;
  final double long;
  final double lat;
  final CibusUser creator;
  Placemark? address;
  final Timestamp createdAt;
  final double weight;

  Donation({
    required this.uniqueId,
    required this.title,
    required this.body,
    required this.imageUrl,
    required this.long,
    required this.lat,
    required this.creator,
    this.address = null,
    required this.createdAt,
    required this.weight,
  });

  void setAddress(Placemark address) {
    this.address = address;
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      uniqueId: map["uid"],
      title: map["title"],
      body: map["body"],
      imageUrl: map["imgUrl"],
      long: map["location"].longitude,
      lat: map["location"].latitude,
      creator: CibusUser.lessFromMap(map["creator"]),
      createdAt: map["createdAt"],
      weight: double.parse( map["weight"].toString()),
    );
  }
}
