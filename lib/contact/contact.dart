import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addContact.dart';
import 'deleteContact.dart';
import 'getContacts.dart';
import 'updateContact.dart';
import 'editContact.dart';

class ContactPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();  // Controller untuk keterangan

  // Menampilkan form untuk menambahkan kontak
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1E6CE),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1E6CE),
        automaticallyImplyLeading: false, // Menghilangkan panah kembali
        title: Text('Add New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust card size to fit content
          children: [
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                        controller: _descriptionController,  // Input untuk keterangan
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            String name = _nameController.text;
                            String phone = _phoneController.text;
                            String description = _descriptionController.text;
                            if (name.isNotEmpty && phone.isNotEmpty && description.isNotEmpty) {
                              addContact(name, phone, description);  // Menambah kontak baru
                              Navigator.pop(context);  // Tutup halaman setelah menambahkan kontak
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Please fill all fields!')),
                              );
                            }
                          },
                          child: Text('Save'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF35423C), // Background color
                            foregroundColor: Colors.white, // Foreground color
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Menutup halaman tanpa menyimpan perubahan
                            Navigator.pop(context);
                          },
                          child: Text('Close'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF35423C), // Background color
                            foregroundColor: Colors.white, // Foreground color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menambah kontak baru ke Firestore
  Future<void> addContact(String name, String phone, String description) async {
    CollectionReference contacts = FirebaseFirestore.instance.collection('contacts');
    await contacts.add({
      'name': name,
      'phone': phone,
      'description': description,
    });
  }
}