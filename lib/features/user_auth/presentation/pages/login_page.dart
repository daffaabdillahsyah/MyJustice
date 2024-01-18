import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myjustice2/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/QRIS.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/chating_page.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/chating_page.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/emergency_call_screen.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/emergency_contacts.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/home_page.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/metode_pembayaran.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/pembayaran_berhasil.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/register_page.dart';
import 'package:myjustice2/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:myjustice2/features/user_auth/presentation/widgets/informasi_daerah.dart';
import 'package:myjustice2/global/common/toast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future register() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text("Login"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/loginimg.png',
                  width: 339,
                  height: 339,
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E356F)),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Masuk untuk melanjutkan.",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0E356F)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                  prefixIconAsset: 'assets/profile.png',
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                  prefixIconAsset:
                      'assets/lock.png', // Replace with your actual asset path
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    _signIn();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Color(0xFF0E356F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: _isSigning
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Masuk",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    _signInWithGoogle();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(
                            0xFF8E949D), // Warna border (stroke) yang diinginkan
                        width: 1.0, // Ketebalan border (stroke) yang diinginkan
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/google_logo.png',
                            // color: Color(0xFFFFFFFF),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Login with Google",
                            style: TextStyle(
                              color: Color(0xFF0E356F),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          color: Color(0xFF0E356F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      showToast(mesagge: "User is successfully signed in");
      Navigator.pushNamed(context, "/home");
    } else {
      showToast(mesagge: "some error occured");
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        await _firebaseAuth.signInWithCredential(credential);
        Navigator.pushNamed(context, "/home");
      }
    } catch (e) {
      showToast(mesagge: "some error occured $e");
    }
  }
}
