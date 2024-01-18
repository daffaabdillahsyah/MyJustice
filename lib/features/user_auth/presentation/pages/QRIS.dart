import 'package:flutter/material.dart';
import 'Pembayaran_berhasil.dart';

class QRCodePaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the size of the QR code image here
    final double qrCodeSize =
        300.0; // Example size, you can adjust this as needed

    return Scaffold(
      appBar: AppBar(
        title: Text('Kode QRIS'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
            // Handle back action
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text(
            'MyJustice',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rp 25.000',
            style: TextStyle(
                fontSize: 24,
                color: Color(0xFF0E356F),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20), // Adds space between text and QR code
          Center(
            child: Container(
              width: qrCodeSize, // Use the defined size for width
              height: qrCodeSize, // Use the defined size for height
              child: Image.asset(
                  'assets/qrisimg.png'), // Replace with your QR code image asset
            ),
          ),
          Text(
            'Berlaku Hingga: 17 Januari 2024, 17:24',
            style: TextStyle(color: Colors.grey),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0E356F), // Background color
                onPrimary: Colors.white, // Text color
                minimumSize: Size(double.infinity,
                    50), // Set the button's size as much as the padding allows
                // Define the button's shape and borderRadius here
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Rounded corners with a radius of 8
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PembayaranBerhasil(),
                  ),
                );
                // Handle button press
              },
              child: Text(
                'Unduh QRIS',
                style: TextStyle(fontSize: 16), // Font size for the button text
              ),
            ),
          ),
        ],
      ),
    );
  }
}
