import 'package:flutter/material.dart';
import 'lawyer_information.dart';

import 'metode_pembayaran.dart';

class SewaPengacara extends StatelessWidget {
  final Lawyer lawyer;

  SewaPengacara({required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: LawyerBookingScreen(lawyer: lawyer),
          ),
        ),
      ),
    );
  }
}

class ConsultationScheduleCard extends StatefulWidget {
  @override
  _ConsultationScheduleCardState createState() =>
      _ConsultationScheduleCardState();
}

class _ConsultationScheduleCardState extends State<ConsultationScheduleCard> {
  String selectedTime = '';
  String selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Jadwal Konsultasi Online',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            // Nested Card for Dates and Times
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildExpansionTile('Selasa, 16 Januari 2024', [
                      '08:00 - 10:00',
                      '11:00 - 13:00',
                      '15:00 - 16:00',
                      '19:00 - 21:00',
                    ]),
                  ],
                ),
              ),
            ),
            Divider(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _buildExpansionTile('Rabu, 17 Januari 2024', [
                      '08:00 - 10:00',
                      '11:00 - 13:00',
                      '15:00 - 16:00',
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Tanggal yang Dipilih: $selectedDate'),
            Text('Waktu yang Dipilih: $selectedTime'),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(String title, List<String> timeSlots) {
    return ExpansionTile(
      title: Text(title),
      children: timeSlots
          .map(
            (time) => ListTile(
              title: Row(
                children: [
                  Text(time),
                  Spacer(), // Add spacer to push the icon to the right
                  if (selectedTime == time) Icon(Icons.check),
                ],
              ),
              onTap: () {
                // Handle tap
                setState(() {
                  selectedTime = time; // Update the selected time
                  selectedDate = title;
                });
              },
            ),
          )
          .toList(),
    );
  }
}

class EducationHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFFF),
      child: ExpansionTile(
        leading: Icon(Icons.school),
        title: ListTile(
          title: Text('Riwayat Pendidikan'),
        ),
        children: [
          // Additional details about education can be added here
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Universitas Indonesia',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text('S1 Hukum'),
                Text('Tahun Masuk: 2015'),
                SizedBox(height: 20),
                Text(
                  'Universitas Gadjah Mada',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('S2 Science Politic'),
                Text('Tahun Masuk: 2020'),
                // Add more details as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UsageInformationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE6F0FF),
      child: ListTile(
        title: Text('Ketentuan Penggunaan',
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(
          'Fasilitas ini dapat memberikan informasi hukum secara umum, menjelaskan konsep hukum, dan memberikan panduan hukum  tanpa menggantikan nasihat hukum khusus dari seorang pengacara. Ditekankan untuk situatu hukum yang lebih kompleks atau khusus, pengguna disarankan untuk konsultasi secara langsung.',
        ),
      ),
    );
  }
}

class LawyerBookingScreen extends StatelessWidget {
  final Lawyer lawyer; // Add this line

  LawyerBookingScreen({required this.lawyer}); // Add this constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(lawyer.imageUrl),
            ),
            Text(
              '${lawyer.name}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('${lawyer.specializations}'),
            Text('${lawyer.rating} ★'),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color.fromARGB(
                255,
                234,
                234,
                234,
              ), // Set background color to #F5F5F5
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  // Include ConsultationScheduleCard here
                  ConsultationScheduleCard(),
                  SizedBox(
                    height: 5,
                  ),
                  EducationHistoryCard(),
                  SizedBox(
                    height: 5,
                  ),
                  UsageInformationCard(),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Biaya Konsultasi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF0E356F)),
                      ),
                      Text(
                        'Rp 25.000',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF0E356F)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MetodePembayaranPage(lawyer: lawyer),
                        ),
                      ); // Handle chat now button press
                    },
                    child: Text(
                      'Chat Sekarang',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5F5F5)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary:
                          Color(0xFF0E356F), // Set your desired button color
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
