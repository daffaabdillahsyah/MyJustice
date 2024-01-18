import 'package:flutter/material.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'home_page.dart';
// Import the 'sewa_pengacara.dart' file
import 'sewa_pengacara.dart';

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

class LawyerInformation extends StatefulWidget {
  @override
  _LawyerInformationState createState() => _LawyerInformationState();
}

class _LawyerInformationState extends State<LawyerInformation> {
  Location? _location;
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _location = Location();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      _getCurrentLocation();
    } else {
      // Handle the case where location permission is not granted
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      _currentLocation = await _location?.getLocation();
      // You have the current location in _currentLocation variable
    } catch (e) {
      // Handle the case where fetching location failed
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pengacara Pilihan',
      home: LawyerListScreen(),
      debugShowCheckedModeBanner: false,
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
    // Add more lawyers if needed
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

  void _navigateToSewaPengacara(Lawyer selectedLawyer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SewaPengacara(lawyer: selectedLawyer),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                'Konsultasi Pengacara',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color.fromARGB(235, 28, 17, 113),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
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
      body: Container(
        color: Color(0xFFFF5F5F5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Color.fromARGB(5, 226, 226, 227),
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
                    SizedBox(height: 16),
                    Text(
                      'Pengacara Pilihan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(235, 28, 17, 113),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Konsultasikan masalah hukum Anda',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(235, 28, 17, 113),
                      ),
                    ),
                    Text(
                      'Dengan pengacara kami',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(235, 28, 17, 113),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredLawyerList.length,
                itemBuilder: (context, index) {
                  return LawyerCard(
                    lawyer: filteredLawyerList[index],
                    onTap: () =>
                        _navigateToSewaPengacara(filteredLawyerList[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LawyerCard extends StatelessWidget {
  final Lawyer lawyer;
  final VoidCallback onTap;

  LawyerCard({required this.lawyer, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 2,
      color: Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 41.5,
                  backgroundImage: AssetImage(lawyer.imageUrl),
                ),
                SizedBox(width: 22),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
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
                        SizedBox(height: 4),
                        Text(
                          lawyer.specializations,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          lawyer.distance,
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${lawyer.experience} - ${lawyer.rating} ★',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 4),
                        Text(
                          lawyer.feePerSession,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(235, 28, 17, 113),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              ),
              child: Text(
                'Chat',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class LawyerDetailScreen extends StatelessWidget {
//   final Lawyer lawyer;

//   LawyerDetailScreen({required this.lawyer});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Pengacara'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: CircleAvatar(
//                 radius: 70,
//                 backgroundImage: AssetImage(lawyer.imageUrl),
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Nama Pengacara: ${lawyer.name}',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 8),
//             Text('Spesialisasi: ${lawyer.specializations}'),
//             SizedBox(height: 8),
//             Text('Jarak: ${lawyer.distance}'),
//             SizedBox(height: 8),
//             Text('Pengalaman: ${lawyer.experience}'),
//             SizedBox(height: 8),
//             Text('Rating: ${lawyer.rating} ★'),
//             SizedBox(height: 8),
//             Text('Biaya per Sesi: ${lawyer.feePerSession}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
