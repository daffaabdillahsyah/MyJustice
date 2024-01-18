import 'package:flutter/material.dart';

// Assuming you have an EmergencyContactData class defined somewhere
class EmergencyContactData {
  String name;
  String phoneNumber;

  EmergencyContactData({required this.name, required this.phoneNumber});
}

class EmergencyContact extends StatefulWidget {
  @override
  _EmergencyContactState createState() => _EmergencyContactState();
}

class _EmergencyContactState extends State<EmergencyContact> {
  List<EmergencyContactData> emergencyContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Contact'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Handle back button
          },
        ),
      ),
      body: ListView.builder(
        itemCount: emergencyContacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(emergencyContacts[index].name),
                Text(emergencyContacts[index].phoneNumber),
                GestureDetector(
                  onTap: () => _editContact(index, context), // Edit contact
                  child: Image.asset(
                    'assets/editkontak.png', // Path to your edit icon asset
                    color: Colors.grey,
                    height: 50.0, // Adjust the size as needed
                    width: 51.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () => _addNewContact(context), // Add new contact
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/tambahkontak.png', // Path to your add icon asset
                  color: Colors.grey,
                  height: 50.0, // Adjust the size as needed
                  width: 51.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editContact(int index, BuildContext context) {
    EmergencyContactData currentContact = emergencyContacts[index];
    TextEditingController nameController = TextEditingController(text: currentContact.name);
    TextEditingController phoneNumberController = TextEditingController(text: currentContact.phoneNumber);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Kontak Darurat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Nomor HP'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  emergencyContacts.removeAt(index);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Hapus'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  emergencyContacts[index] = EmergencyContactData(
                    name: nameController.text,
                    phoneNumber: phoneNumberController.text,
                  );
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _addNewContact(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tambah Kontak Darurat'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(labelText: 'Nomor HP'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close the dialog
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  EmergencyContactData newContact = EmergencyContactData(
                    name: nameController.text,
                    phoneNumber: phoneNumberController.text,
                  );
                  emergencyContacts.add(newContact);
                });
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }
}

