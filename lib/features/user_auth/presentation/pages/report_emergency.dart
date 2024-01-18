import 'package:flutter/material.dart';
import 'sos_page.dart';

class ReportEmergencyPage extends StatefulWidget {
  @override
  _ReportEmergencyPageState createState() => _ReportEmergencyPageState();
}

class _ReportEmergencyPageState extends State<ReportEmergencyPage> {
  final _controller = TextEditingController();
  String? selectedTemplate;

  // Map to store narratives for each template
  final Map<String, String> templateNarratives = {
    'Template 1: Harassment':
        'Saya ingin melaporkan bahwa saya menghadapi pelecehan. Kejadian ini sangat mengganggu. Saya meminta agar pihak yang berwenang dapat melakukan penyelidikan menyeluruh terhadap laporan ini, melibatkan saksi-saksi yang mungkin dapat memberikan informasi tambahan. Saya berharap laporan ini dapat ditangani dengan serius demi menciptakan lingkungan yang aman dan bebas dari pelecehan.',
    'Template 2: Discrimination':
        'Saya sedang mengalami diskriminasi di mana pelaku melakukan tindakan atau mengucapkan kata-kata yang dianggap tidak pantas, meresahkan, dan melanggar norma etika. Dalam menanggapi laporan ini, saya berharap dapat mendapatkan dukungan untuk kasus saya sehingga tindakan terhadap pelaku dapat diambil secepat mungkin.',
    'Template 3: Unsafe Working Conditions':
        'Saya ingin melaporkan kondisi kerja yang tidak aman di tempat kerja. Saya merasakan bahwa kondisi tempat saya bekerja sekarang tidak memberikan hak pada pekerjanya. Laporan ini dibuat agar pihak terkait dapat segera melakukan evaluasi menyeluruh terhadap kondisi kerja ini. Kesejahteraan dan keselamatan karyawan adalah prioritas utama kami, dan perbaikan yang cepat akan membantu menciptakan lingkungan kerja yang lebih aman dan sehat.',
    // Add more templates and narratives as needed
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Report Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pilih kategori kejahatan yang dialami atau isi informasi secara detail terkait kejadian yang dialami. ',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedTemplate,
              hint: Text('Select a template'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTemplate = newValue;
                  if (newValue != null) {
                    // Set the template narrative to the controller text
                    _controller.text = templateNarratives[newValue] ?? '';
                  }
                });
              },
              items: templateNarratives.keys.map((String template) {
                return DropdownMenuItem<String>(
                  value: template,
                  child: Text(template),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter details about your issue...',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String userComplaint = _controller.text;
                String finalComplaint =
                    selectedTemplate != null && selectedTemplate!.isNotEmpty
                        ? '$selectedTemplate\n\n$userComplaint'
                        : userComplaint;

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Column(
                        children: [
                          Image.asset('assets/alert.png',
                              width: 50,
                              height:
                                  50), // Replace 'your_image.png' with your actual image path
                          SizedBox(height: 8),
                          Text(
                            'Laporan Diterima',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      content: Text(
                          'Pesan berhasil dikirim ke kontak list Anda. Mohon mencari tempat aman untuk berlindung. Segera hubungi pihak berwenang atau layanan darurat terdekat.\n(call : 112)'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SOSPage(),
                              ),
                            );
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(235, 28, 17, 113)),
              ),
              child: Text(
                'Kirim Laporan',
                style:
                    TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
