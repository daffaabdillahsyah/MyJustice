import 'package:flutter/material.dart';
import 'lawyer_information.dart';

class HomePage extends StatelessWidget {
  // Dummy data for your features. You will replace these with your actual data.
  final List<Map<String, dynamic>> features = [
    {'icon': Icons.sos, 'label': 'SOS'},
    {'icon': Icons.help_outline, 'label': 'Konsultasi'},
    {'icon': Icons.people_alt_outlined, 'label': 'Sewa Pengacara'},
    {'icon': Icons.book_outlined, 'label': 'Informasi Hukum'},
    {'icon': Icons.share, 'label': 'Sharing'},
    {'icon': Icons.info_outline, 'label': 'Informasi Pengacara Sekitar'},
    {'icon': Icons.document_scanner_outlined, 'label': 'Pembuatan Dokumen'},
    {'icon': Icons.folder_open_outlined, 'label': 'Kasusku'},
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
                      color: Color(0xFF0E356F),
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
                  physics:
                      NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // number of items per row
                    childAspectRatio: 1, // aspect ratio of each item
                    crossAxisSpacing: 10, // horizontal spacing
                    mainAxisSpacing: 10, // vertical spacing
                  ),
                  itemCount: features.length, // number of items in your list
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (features[index]['label'] ==
                            'Informasi Pengacara Sekitar') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LawyerInformation(),
                            ),
                          );
                        } else {
                          // Handle other onTap actions here
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            features[index]['icon'],
                            size: 24, // icon size
                          ),
                          Text(
                            features[index]['label'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12, // text size
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
