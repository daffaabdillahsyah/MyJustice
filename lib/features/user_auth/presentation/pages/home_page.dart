import 'package:flutter/material.dart';

import 'chat_page.dart';
import 'lawyer_information.dart';
import 'sos_page.dart';
import '../widgets/informasi_daerah.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showSewaPengacaraAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              Image.asset(
                'assets/calender.png',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 15),
              Text(
                'Ketersediaan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text(
              "Sebelum mengambil keputusan, kami menyarankan Anda untuk berkonsultasi terkait ketersediaan dan jadwal pengacara."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Tutup"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LawyerInformation(),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(235, 28, 17, 113)),
              ),
              child: Text(
                "Konsultasi",
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        );
      },
    );
  }

  int _selectedIndex = 0;

  final List<Map<String, dynamic>> features = [
    {'icon': Icons.sos, 'label': 'SOS'},
    {'icon': Icons.help_outline, 'label': 'Konsultasi'},
    {'icon': Icons.people_alt_outlined, 'label': 'Sewa Pengacara'},
    {'icon': Icons.book_outlined, 'label': 'Informasi Hukum'},
    {'icon': Icons.share, 'label': 'Sharing'},
    {'icon': Icons.info_outline, 'label': 'Kasus Kejahatan Sekitar'},
    {'icon': Icons.document_scanner_outlined, 'label': 'Pembuatan Dokumen'},
    {'icon': Icons.folder_open_outlined, 'label': 'Kasusku'},
  ];

  final List<String> newsImages = [
    'assets/berita1.png', // Replace with the actual image paths
    'assets/berita2.png',
    'assets/berita3.png',
    // Add more news images as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, top: 30, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Navigate to a different screen if needed
                      },
                      child: const Text(
                        'Hallo, Chaesa',
                        style: TextStyle(
                          color: Color(0xFF0E356F),
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile2.png'),
                      radius: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Sedang cari apa?',
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Transform.scale(
                  scale: 1,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 10, right: 160, top: 50, bottom: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/background.png'), // Replace 'your_image_path.jpg' with the actual path to your image asset
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Kini lebih mudah dengan MyJustice',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: features.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (features[index]['label'] == 'Konsultasi') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LawyerInformation(),
                            ),
                          );
                        } else if (features[index]['label'] == 'SOS') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SOSPage(),
                            ),
                          );
                        } else if (features[index]['label'] ==
                            'Sewa Pengacara') {
                          _showSewaPengacaraAlert();
                        } else if (features[index]['label'] ==
                            'Kasus Kejahatan Sekitar') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InformasiDaerah(),
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        width: 80, // Set a fixed width
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                color: Color(0xFF0E356F),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                features[index]['icon'],
                                size: 24,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              features[index]['label'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                // News section
                Text(
                  'Berita Terbaru',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0E356F),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: newsImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            newsImages[index],
                            width: 200,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/home.png', width: 24, height: 24),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/pesan.png', width: 24, height: 24),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Riwayat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });

            // Navigation logic
            if (index == 1) {
              // Navigate to the Chat page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(),
                ),
              );
            }

            // Other navigation logic for other indices if needed
          },
          selectedItemColor: Color(0xFF0E356F),
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
