import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'contact.dart'; // Pastikan Anda sudah membuat contact.dart untuk menambahkan kontak baru
import 'editContact.dart'; // Pastikan Anda sudah membuat editContact.dart untuk mengedit kontak

class ContactPageScreen extends StatelessWidget {
  // Fungsi untuk mendapatkan kontak dari Firestore
  Stream<QuerySnapshot> getContacts() {
    return FirebaseFirestore.instance.collection('contacts').snapshots();
  }

  // Fungsi untuk menghapus kontak
  Future<void> deleteContact(String contactId) async {
    await FirebaseFirestore.instance.collection('contacts').doc(contactId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1E6CE),
      body: StreamBuilder<QuerySnapshot>(
        stream: getContacts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var contacts = snapshot.data!.docs;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                var contact = contacts[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(contact['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${contact['phone']}'),
                        Text('Description: ${contact['description']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tombol Edit (Optional, jika Anda ingin menambahkan fitur edit)
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            // Navigate ke halaman editContact.dart untuk mengedit kontak
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditContactPage(
                                  contactId: contact.id,
                                  currentName: contact['name'],
                                  currentPhone: contact['phone'],
                                  currentDescription: contact['description'],
                                ),
                              ),
                            );
                          },
                        ),
                        // Tombol Delete untuk menghapus kontak
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Konfirmasi penghapusan
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Delete Contact'),
                                  content: Text('Are you sure you want to delete this contact?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Tutup dialog
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await deleteContact(contact.id); // Hapus kontak
                                        Navigator.of(context).pop(); // Tutup dialog setelah menghapus
                                      },
                                      child: Text('Delete', style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate ke halaman contact.dart untuk menambahkan kontak baru
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContactPage()), // Pastikan halaman ContactFormPage adalah halaman untuk menambah kontak
          );
        },
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
