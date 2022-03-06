import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getCurrentUserSnapshot() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    DocumentReference doc = users.doc(_firebaseAuth.currentUser!.uid);
    DocumentSnapshot snapshot = await doc.get();

    return snapshot;
  }

  Future<List<Map<String, dynamic>>> getCurrentUserPosts() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firestore.collection("posts").get();

    List<Map<String, dynamic>> donations = [];
    querySnapshot.docs.forEach((donation) {
      if (donation.data()["creator"]["uid"] == _firebaseAuth.currentUser!.uid) {
        donations.add(donation.data());
      }
    });

    return donations;
  }
}
