import 'package:flutter/material.dart';
import '\home_page.dart';

class PembayaranBerhasil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/PembayaranBerhasil.png',
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 20),
                Text(
                  'Pembayaran Berhasil',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0E356F),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Transaksi Anda telah berhasil diselesaikan.\nMohon kembali ke menu pesan untuk\nmelanjutkan atau menu utama\nmengeskplorasi layanan lainnya. Terima\nkasih atas kepercayaan Anda!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF0E356F),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
                // Aksi ketika tombol ditekan
              },
              child: Text('Kembali Ke Menu Utama'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0E356F),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
