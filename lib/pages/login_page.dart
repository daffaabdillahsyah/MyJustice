import 'package:flutter/material.dart';
import 'register_page.dart'; // Impor file register_page.dart
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/loginimg.png', width: 259, height: 259),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Login',
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
                      'Masuk untuk melanjutkan',
                      style: TextStyle(
                        color: Color(0xFF0E356F),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    hint: 'Username',
                    icon: AssetImage('assets/profile.png'),
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    hint: 'Password',
                    icon: AssetImage('assets/lock.png'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 8), // Tambahkan jarak kecil
                  TextButton(
                    onPressed: () {
                      // Implement forgot password logic
                    },
                    child: const Text(
                      'Lupa Password?',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: const Text(
                      'Masuk',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0E356F),
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman pendaftaran
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text(
                      'Tidak memiliki akun? Daftar',
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String? hint,
      required ImageProvider<Object> icon,
      bool obscureText = false}) {
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
