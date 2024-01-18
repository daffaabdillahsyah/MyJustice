import 'package:flutter/material.dart';
import 'videocall_payment.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String avatarFileName;
  final String time;

  ChatScreen({
    required this.name,
    required this.avatarFileName,
    required this.time,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _navigateToPayment(BuildContext context) {
    print('Navigating to VideoCallRent screen');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallRent(
          name: widget.name,
          avatarFileName: widget.avatarFileName,
        ),
      ),
    );
  }

  final TextEditingController _messageController = TextEditingController();
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages.add(Message(
      sender: '${widget.name}',
      text:
          'Selamat datang! Terima kasih telah memilih untuk berkonsultasi dengan saya. Bagaimana saya dapat membantu Anda hari ini?',
      isSentByMe: false,
    ));
    _messages.add(Message(
      sender: 'You',
      text:
          'Saya mengalami masalah yang cukup rumit di tempat kerja saya. Saya merasa tidak adil diperlakukan oleh atasan saya dan merasa bahwa hak-hak saya sebagai karyawan dilanggar. Beberapa keputusan yang diambil di tempat kerja ini menimbulkan ketidaknyamanan dan ketidakpastian untuk saya. Apakah Anda bisa memberikan pandangan hukum tentang situasi ini dan memberi saya saran tentang langkah yang sebaiknya diambil?',
      isSentByMe: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/${widget.avatarFileName}'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${widget.name}',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Hukum Perdata, Hukum Pidana',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: ImageIcon(AssetImage('assets/video.png')),
            onPressed: () {
              _navigateToPayment(context);
            },
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount:
                  _messages.length + 1, // Tambahkan 1 untuk tanggal dan waktu
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Tampilkan tanggal dan waktu di indeks pertama
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '${widget.time}', // Ganti dengan tanggal dan waktu yang sesuai
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF72777A)),
                      ),
                    ),
                  );
                }
                final message = _messages[
                    index - 1]; // Kurangkan 1 karena indeks 0 adalah tanggal
                if (!message.isSentByMe) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 20), // Add space before the avatar
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${widget.avatarFileName}'),
                      ),
                      SizedBox(
                          width:
                              8), // Add space between the avatar and the bubble
                      Flexible(
                        child: _buildMessageBubble(message, false),
                      ),
                    ],
                  );
                } else {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: _buildMessageBubble(message, true),
                  );
                }
              },
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message, bool isSentByMe) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: isSentByMe ? 70 : 15, // Increase left margin for sent messages
        right:
            isSentByMe ? 15 : 50, // Increase right margin for received messages
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: isSentByMe ? Color(0xFF0E356F) : Colors.grey[300],
        borderRadius: isSentByMe
            ? BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(0),
              )
            : BorderRadius.only(
                topLeft: Radius.circular(0),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
      ),
      child: Column(
        crossAxisAlignment:
            isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.text,
            style: TextStyle(color: isSentByMe ? Colors.white : Colors.black),
          ),
          SizedBox(height: 5), // Add spacing between message and date/time
          Text(
            '${widget.time}', // Tampilkan hanya jam di sini
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageComposer() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0), // Adds padding to the bottom
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _messageController,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Slightly rounded corners for a modern look
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  suffixIcon: IconButton(
                    icon: Icon(Icons
                        .add), // Change this icon if you want to use a different one for adding files
                    onPressed: () {
                      // Implement your file/photo sending functionality here
                    },
                  ),
                ),
              ),
            ),
            Ink(
              decoration: ShapeDecoration(
                color: Colors.transparent, // This makes the circle transparent
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Padding(
                  padding: EdgeInsets.all(0), // Add your desired padding
                  child: SizedBox(
                    width: 44.0, // Your desired width for the icon
                    height: 44.0, // Your desired height for the icon
                    child: Image.asset(
                        'assets/sendbutton.png'), // Replace with the path to your image asset
                  ),
                ),
                onPressed: () => _sendMessage(_messageController.text),
                splashColor: Colors.transparent, // Prevents the splash effect
                highlightColor:
                    Colors.transparent, // Prevents the highlight effect
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add(Message(
        sender: 'You',
        text: text,
        isSentByMe: true,
      ));
      _messageController.clear();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}

class Message {
  String sender;
  String text;
  bool isSentByMe;

  Message({required this.sender, required this.text, required this.isSentByMe});
}
