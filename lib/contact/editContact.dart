import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addContact.dart';
import 'deleteContact.dart';
import 'getContacts.dart';
import 'updateContact.dart';

class EditContactPage extends StatefulWidget {
  final String contactId;
  final String currentName;
  final String currentPhone;
  final String currentDescription;

  EditContactPage({
    required this.contactId,
    required this.currentName,
    required this.currentPhone,
    required this.currentDescription,
  });

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _phoneController = TextEditingController(text: widget.currentPhone);
    _descriptionController = TextEditingController(text: widget.currentDescription);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1E6CE),
      appBar: AppBar(
        backgroundColor: Color(0xFFF1E6CE),
        automaticallyImplyLeading: false,
        title: Text('Edit Contact'),
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
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // Kembali ke halaman sebelumnya tanpa menyimpan perubahan
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF35423C), // Background color
                            foregroundColor: Colors.white, // Text color
                          ),
                          child: Text('Cancel'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            String name = _nameController.text;
                            String phone = _phoneController.text;
                            String description = _descriptionController.text;
                            if (name.isNotEmpty && phone.isNotEmpty && description.isNotEmpty) {
                              // Memperbarui kontak di Firestore
                              updateContact(widget.contactId, name, phone, description);
                              Navigator.pop(context); // Kembali ke halaman sebelumnya
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF35423C), // Background color
                            foregroundColor: Colors.white, // Text color
                          ),
                          child: Text('Update Contact'),
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

  // Fungsi untuk memperbarui kontak
  Future<void> updateContact(String id, String name, String phone, String description) async {
    await FirebaseFirestore.instance.collection('contacts').doc(id).update({
      'name': name,
      'phone': phone,
      'description': description,
    });
  }
}
