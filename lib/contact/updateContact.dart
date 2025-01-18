import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateContact(String id, String name, String phone, String description) async {
  await FirebaseFirestore.instance.collection('contacts').doc(id).update({
    'name': name,
    'phone': phone,
    'description': description,  // Menambahkan kolom keterangan
  });
}
