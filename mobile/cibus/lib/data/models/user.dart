import 'package:cibus/data/models/donation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CibusUser {
  final bool isValid;
  final String uid;
  final String email;
  final String name;
  final String orgName;
  final String pfpUrl;
  final String orgType;
  List<Donation> posts;

  CibusUser(
      {required this.isValid,
      this.uid = "ASASFASFASF",
      this.email = "",
      this.orgName = "",
      this.orgType = "",
      this.name = "",
      this.pfpUrl = "",
      this.posts = const []});

  Map<String, dynamic> userToMap() {
    return {
      "uid" : this.uid,
      "name" : this.name,
      "email" : this.email,
      "orgName" : this.orgName,
      "orgType" : this.orgType,
      "profilePic" : this.pfpUrl,
    };
  }

  factory CibusUser.fullFromSnapshot(
      DocumentSnapshot snapshot, List<Donation> posts) {
    return CibusUser(
      isValid: true,
      uid: snapshot["uid"],
      email: snapshot["email"],
      name: snapshot["name"],
      orgName: snapshot["orgName"],
      orgType: snapshot["orgType"],
      pfpUrl: snapshot["profilePic"] != ""
          ? snapshot["profilePic"]
          : "https://www.pinclipart.com/picdir/big/z157-1578186_user-profile-default-image-png-clipart.png",
      posts: posts,
    );
  }

  factory CibusUser.lessFromSnapshot(DocumentSnapshot snapshot) {
    return CibusUser(
      isValid: true,
      uid: snapshot["uid"],
      email: snapshot["email"],
      name: snapshot["name"],
      orgName: snapshot["orgName"],
      orgType: snapshot["orgType"],
      pfpUrl: snapshot["profilePic"] != ""
          ? snapshot["profilePic"]
          : "https://www.pinclipart.com/picdir/big/157-1578186_user-profile-default-image-png-clipart.png",
    );
  }

  factory CibusUser.fullFromMap(
      Map<String, dynamic> map, List<Donation> posts) {
    return CibusUser(
      isValid: true,
      uid: map["uid"],
      email: map["email"],
      name: map["name"],
      orgName: map["orgName"],
      orgType: map["orgType"],
      pfpUrl: map["profilePic"] != ""
          ? map["profilePic"]
          : "https://www.pinclipart.com/picdir/big/157-1578186_user-profile-default-image-png-clipart.png",
      posts: posts,
    );
  }

  factory CibusUser.lessFromMap(Map<String, dynamic> map) {
    return CibusUser(
      isValid: true,
      uid: map["uid"],
      email: map["email"],
      name: map["name"],
      orgName: map["orgName"],
      orgType: map["orgType"],
      pfpUrl: map["profilePic"],
    );
  }
}
