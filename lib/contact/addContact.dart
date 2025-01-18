import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addContact(String name, String phone, String description) async {
  CollectionReference contacts = FirebaseFirestore.instance.collection('contacts');
  await contacts.add({
    'name': name,
    'phone': phone,
    'description': description,  // Menambahkan kolom keterangan
  });
}
