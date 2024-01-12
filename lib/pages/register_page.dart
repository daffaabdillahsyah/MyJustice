import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/registerimg.png', width: 259, height: 259),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xFF0E356F),
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Silahkan daftar untuk masuk.',
                    style: TextStyle(
                      color: Color(0xFF0E356F),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                _buildTextField(
                  hint: 'Full Name',
                  icon: AssetImage('assets/profile.png'),
                ),
                SizedBox(height: 16),
                _buildTextField(
                  hint: 'Nomor Telepon',
                  icon: AssetImage('assets/call.png'),
                ),
                SizedBox(height: 16),
                _buildTextField(
                  hint: 'Password',
                  icon: AssetImage('assets/lock.png'),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Implement register logic
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(color: Color.fromARGB(255, 253, 253, 253)),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0E356F),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman pendaftaran
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Sudah memiliki akun? Login',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String? hint,
    required ImageProvider<Object> icon,
    bool obscureText = false,
  }) {
    return Container(
      width: 306,
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: ImageIcon(icon), // Menggunakan ImageIcon untuk gambar
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
