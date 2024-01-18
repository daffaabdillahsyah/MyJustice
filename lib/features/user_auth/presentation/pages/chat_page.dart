import 'package:flutter/material.dart';
import 'chating_page.dart';

import 'home_page.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _selectedIndex = 1;

  final Map<String, String> lawyerAvatars = {
    'Roger Simbolon, S.H': 'dummy_roger.png',
    'Michael Tarumanegara, S.H': 'dummy_michael.png',
    'Velicia Renata, S.H': 'dummy_velicia.png',
    'Elizabeth Verga, S.H': 'dummy_elizabeth.png',
    // Add more lawyers as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Pesan Anda',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // Add a Divider below the text
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          buildChatItem(
            name: 'Roger Simbolon, S.H',
            message: 'Sesi sedang berlangsung',
            time: '18:03',
            isSessionOngoing: true,
            avatarFileName: lawyerAvatars['Roger Simbolon, S.H']!,
          ),
          buildChatItem(
            name: 'Michael Tarumanegara, S.H',
            message: 'Sesi akan berlangsung',
            time: '20:05',
            isSessionOngoing: false,
            avatarFileName: lawyerAvatars['Michael Tarumanegara, S.H']!,
          ),
          buildChatItem(
            name: 'Velicia Renata, S.H',
            message: 'Sesi akan berlangsung',
            time: '17/02/2023',
            isSessionOngoing: false,
            avatarFileName: lawyerAvatars['Velicia Renata, S.H']!,
          ),
          buildChatItem(
            name: 'Elizabeth Verga, S.H',
            message: 'Sesi Berakhir - 1 minggu lalu',
            time: '14/01/2023',
            isSessionOngoing: false,
            avatarFileName: lawyerAvatars['Elizabeth Verga, S.H']!,
          ),
          // Add more ChatItem widgets here
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildChatItem({
    required String name,
    required String message,
    required String time,
    required bool isSessionOngoing,
    required String avatarFileName,
  }) {
    return Card(
      child: ChatItem(
        name: name,
        message: message,
        time: time,
        isSessionOngoing: isSessionOngoing,
        avatarFileName: avatarFileName,
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
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
        if (index == 0) {
          // Navigate to the Home page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }

        // Other navigation logic for other indices if needed
      },
      selectedItemColor: Color(0xFF0E356F),
      unselectedItemColor: Colors.grey,
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool isSessionOngoing;
  final String avatarFileName;

  const ChatItem({
    Key? key,
    required this.name,
    required this.message,
    required this.time,
    required this.isSessionOngoing,
    required this.avatarFileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String avatarPath = 'assets/$avatarFileName';

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatarPath),
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              name: name,
              avatarFileName: avatarFileName,
              time: time,
            ), // Ganti dengan halaman chat yang sesuai
          ),
        ); // Handle tap
      },
    );
  }
}
