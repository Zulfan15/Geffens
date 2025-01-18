import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteContact(String id) async {
  await FirebaseFirestore.instance.collection('contacts').doc(id).delete();
}
