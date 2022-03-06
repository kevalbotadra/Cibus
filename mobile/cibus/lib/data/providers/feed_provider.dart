import 'package:cloud_firestore/cloud_firestore.dart';

class FeedProvider {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
