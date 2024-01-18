import 'package:flutter/material.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/emergency_contacts.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/home_page.dart';
import 'report_emergency.dart';

import 'emergency_call_screen.dart';

class SOSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false; // Return false to prevent the system from handling the back button
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('Emergency SOS'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
            automaticallyImplyLeading: false, // Disable this line
          ),
          body: Center(
            child: EmergencySOS(),
          ),
        ),
      ),
    );
  }
}

class EmergencySOS extends StatefulWidget {
  @override
  _EmergencySOSState createState() => _EmergencySOSState();
}

class _EmergencySOSState extends State<EmergencySOS> {
  bool _hasSignal = true;
  bool _isSending = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/emergencySOS.png', // Replace with your image asset path
          width: 250, // Adjust the width as needed
          height: 200, // Adjust the height as needed
          fit: BoxFit.cover, // Adjust the BoxFit property as needed
        ),
        SizedBox(height: 25),
        Container(
          child: Center(
            child: RichText(
              textAlign: TextAlign.center, // Teks akan berada di tengah
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '1. Pastikan Anda memiliki sinyal yang baik.\n',
                    style: TextStyle(
                      color: Color(0xFF4D5055),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text:
                        '2. Pesan akan memakan waktu lebih lama \nuntuk dikirim.\n',
                    style: TextStyle(
                      color: Color(0xFF4D5055),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text:
                        '3. Jawab pertanyaan untuk mendapatkan \nrespons yang lebih cepat.',
                    style: TextStyle(
                      color: Color(0xFF4D5055),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 2),
        // Container(
        //   alignment: Alignment.centerRight,
        //   child: Text(
        //     '- Pesan akan memakan waktu lebih lama untuk dikirim.',
        //     style: TextStyle(
        //       fontSize: 14,
        //       color: Color.fromARGB(235, 28, 17, 113),
        //     ),
        //   ),
        // ),
        // Container(
        //   alignment: Alignment.center,
        //   child: Text(
        //     '- Jawab pertanyaan untuk mendapatkan respons yang lebih cepat.',
        //     style: TextStyle(
        //       fontSize: 14,
        //       color: Color.fromARGB(235, 28, 17, 113),
        //     ),
        //   ),
        // ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            _isSending
                ? 'Pesan akan memakan waktu lebih lama untuk dikirim'
                : '',
            style: TextStyle(color: const Color.fromARGB(255, 142, 85, 85)),
          ),
        ),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReportEmergencyPage(),
              ),
            ); // Handle chat now button press
          },
          child: Text('LAPOR KEADAAN',
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            primary: Color(0xEB0E356F),
            minimumSize: Size(200, 50),
          ),
        ),
        SizedBox(height: 32),
        Container(
          alignment: Alignment.center,
          child: Text(
            _hasSignal
                ? 'Apabila mengalami keadaan darurat'
                : 'Tekan tombol dibawah ini',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmergencyContact(),
              ),
            ); // Handle chat now button press
          },
          child: Text(
            'Kontak Darurat',
            style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xEB0E356F),
            minimumSize: Size(200, 50),
          ),
        ),
      ],
    );
  }

  void _reportCondition() {
    setState(() {
      _isSending = true;
    });

    // TODO: Implementasi untuk mengirim laporan keadaan

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Terima kasih, laporan Anda telah diterima'),
        duration: Duration(seconds: 4),
      ),
    );

    setState(() {
      _isSending = false;
    });
  }

//   void _callEmergencyNumber() async {
//     final url = 'tel:112';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

  void _callEmergencyNumber(BuildContext context) async {
    setState(() {
      _isSending = true;
    });

    // Show the Emergency Call Screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmergencyCallScreen()),
    );

    // Simulate a delay for demonstration purposes (replace with actual logic)
    await Future.delayed(Duration(seconds: 3));

    // Complete the emergency call
    await _completeEmergencyCall();

    setState(() {
      _isSending = false;
    });
  }

  Future<void> _completeEmergencyCall() async {
    // TODO: Implement logic to handle completion of the emergency call
  }
}
