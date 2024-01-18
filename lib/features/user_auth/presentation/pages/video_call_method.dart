import 'package:flutter/material.dart';
import 'QRIS_videocall.dart';

class VideoCallMethod extends StatefulWidget {
  final String name;
  final String avatarFileName;

  VideoCallMethod({required this.name, required this.avatarFileName});

  @override
  _MetodePembayaranPageState createState() => _MetodePembayaranPageState();
}

class ProfileInformationCard extends StatelessWidget {
  final String name;
  final String avatarFileName; // Add this line

  ProfileInformationCard({required this.name, required this.avatarFileName});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFFF),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/${avatarFileName}'),
          radius: 30,
        ),
        title: Text('${name}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text('Hukum Perdata, Hukum Pidana'),
      ),
    );
  }
}

class DetailPaymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFFF),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Detail Pembayaran',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            subtitle: Text('Biaya Konsultasi'),
            trailing: Text('Rp 300.000'),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Total Bayar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            trailing: Text(
              'Rp 300.000',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFF0E356F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MetodePembayaranPageState extends State<VideoCallMethod> {
  Widget paymentOptionCard({
    required Widget leading,
    required String title,
    VoidCallback? onTap,
    double height = 80.0, // default height
    double? width,
  }) {
    return SizedBox(
      height: height,
      width: width,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: ListTile(
          leading: leading,
          title: Text(title),
          trailing: Icon(Icons.chevron_right),
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Metode Pembayaran'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Color.fromARGB(
        255,
        234,
        234,
        234,
      ),
      body: ListView(
        children: <Widget>[
          ProfileInformationCard(
            name: widget.name,
            avatarFileName: widget.avatarFileName,
          ),
          DetailPaymentCard(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              title: Text('E-Wallet',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ),
          ),
          paymentOptionCard(
            leading:
                Image.asset('assets/shopeepay.png', width: 40.0, height: 40.0),
            title: 'ShopeePay',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRCodeVideoCallScreen(),
                ),
              );
              // Handle Go-pay tap
            },
            height: 60.0, // custom height for this card
          ),
          paymentOptionCard(
            leading:
                Image.asset('assets/go-pay.png', width: 40.0, height: 40.0),
            title: 'Go-pay',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRCodeVideoCallScreen(),
                ),
              );
              // Handle Go-pay tap
            },
            height: 60.0, // custom height for this card
          ),
          paymentOptionCard(
            leading: Image.asset('assets/ovo.png', width: 40.0, height: 40.0),
            title: 'OVO',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRCodeVideoCallScreen(),
                ),
              );
              // Handle OVO tap
            },
            height: 60.0, // custom height for this card
          ),
          ListTile(
            title: Text('Virtual Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          paymentOptionCard(
            leading: Image.asset('assets/bca.png', width: 40.0, height: 40.0),
            title: 'BCA',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRCodeVideoCallScreen(),
                ),
              );
              // Handle Go-pay tap
            },
            height: 60.0, // custom height for this card
          ),
          paymentOptionCard(
            leading:
                Image.asset('assets/mandiri.png', width: 40.0, height: 40.0),
            title: 'Mandiri',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QRCodeVideoCallScreen(),
                ),
              );
              // Handle Go-pay tap
            },
            height: 60.0, // custom height for this card
          ),
          // ... Tambahkan lebih banyak opsi pembayaran jika diperlukan
        ],
      ),
    );
  }
}
