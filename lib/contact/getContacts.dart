import 'package:cloud_firestore/cloud_firestore.dart';

Stream<QuerySnapshot> getContacts() {
  return FirebaseFirestore.instance
      .collection('contacts')
      .snapshots();
}
