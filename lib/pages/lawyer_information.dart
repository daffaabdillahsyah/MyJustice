import 'package:flutter/material.dart';

// Kelas untuk mewakili informasi Pengacara
class Lawyer {
  final String name;
  final String specializations;
  final String distance;
  final double rating;
  final String experience;
  final String feePerSession;
  final String imageUrl;

  Lawyer({
    required this.name,
    required this.specializations,
    required this.distance,
    required this.rating,
    required this.experience,
    required this.feePerSession,
    required this.imageUrl,
  });
}

class LawyerInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengacara Pilihan',
      home: LawyerListScreen(),
    );
  }
}

class LawyerListScreen extends StatefulWidget {
  @override
  _LawyerListScreenState createState() => _LawyerListScreenState();
}

class _LawyerListScreenState extends State<LawyerListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Lawyer> filteredLawyerList = [];

  final List<Lawyer> lawyerList = [
    Lawyer(
      name: 'Michael Tarumanegara, S.H',
      specializations: 'Hukum Perdata, Hukum Pidana',
      distance: '15 km dari Anda',
      rating: 4.5,
      experience: '1 Tahun',
      feePerSession: 'Rp 25,000 / Sesi',
      imageUrl: 'assets/dummy_michael.png',
    ),
    Lawyer(
      name: 'Velicia Renata, S.H',
      specializations: 'Hukum Perdata, Hukum Pidana',
      distance: '25 km dari Anda',
      rating: 4.7,
      experience: '1.5 Tahun',
      feePerSession: 'Rp 25,000 / Sesi',
      imageUrl: 'assets/dummy_velicia.png',
    ),
    Lawyer(
      name: 'Roger Simbolon, S.H',
      specializations: 'Hukum Perdata, Hukum Pidana',
      distance: '20 km dari Anda',
      rating: 4.5,
      experience: '1 Tahun',
      feePerSession: 'Rp 25,000 / Sesi',
      imageUrl: 'assets/dummy_roger.png',
    ),
    Lawyer(
      name: 'Elizabeth Verga, S.H',
      specializations: 'Hukum Perdata, Hukum Pidana',
      distance: '15 km dari Anda',
      rating: 4.2,
      experience: '1 Tahun',
      feePerSession: 'Rp 25,000 / Sesi',
      imageUrl: 'assets/dummy_elizabeth.png',
    ),
    // Tambahkan pengacara lain sesuai dengan format di atas
  ];

  @override
  void initState() {
    super.initState();
    filteredLawyerList = List.from(lawyerList);
  }

  void _filterLawyersBySpecialization(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLawyerList = List.from(lawyerList);
      } else {
        filteredLawyerList = lawyerList
            .where((lawyer) => lawyer.specializations
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengacara Pilihan'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {},
            itemBuilder: (BuildContext context) {
              return {'Settings', 'Profile'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterLawyersBySpecialization,
              decoration: InputDecoration(
                hintText: 'Cari berdasarkan spesialisasi',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLawyerList.length,
              itemBuilder: (context, index) {
                return LawyerCard(lawyer: filteredLawyerList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LawyerCard extends StatelessWidget {
  final Lawyer lawyer;

  LawyerCard({required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 364,
        height: 140,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 25, left: 17),
              width: 83.0,
              height: 83.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(lawyer.imageUrl),
                ),
              ),
            ),
            SizedBox(
                width: 22), // Adjusted space between the image and the text
            Expanded(
              child: Container(
                height: 75,
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      lawyer.name,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Icon-text row for specializations, distance, etc.
                    Row(
                      children: [
                        Icon(Icons.gavel, size: 11), // Change to relevant icon
                        SizedBox(width: 5),
                        Text(
                          lawyer.specializations,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 11),
                        SizedBox(width: 5),
                        Text(
                          lawyer.distance,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 11),
                        SizedBox(width: 5),
                        Text(
                          lawyer.experience,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money, size: 11), // Change to relevant icon
                        SizedBox(width: 5),
                        Text(
                          lawyer.feePerSession,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 95),
              width: 64,
              height: 32,
              child: ElevatedButton(
                onPressed: () {
                  // Implement chat functionality here
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Use your primary color here
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                ),
                child: Text(
                  'Chat',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(LawyerInformation());
}
