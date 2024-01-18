import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myjustice2/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/login_page.dart';
import 'package:myjustice2/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:myjustice2/global/common/toast.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _fullnameController = TextEditingController();
  // TextEditingController _ageController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isRegister = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _fullnameController.dispose();
    // _ageController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text("Register"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   "Register",
                //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  height: 0,
                ),
                Image.asset(
                  'assets/registerimg.png',
                  width: 339,
                  height: 339,
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Register",
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
                    "Silahkan daftar untuk masuk.",
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
                  controller: _usernameController,
                  hintText: "Username",
                  isPasswordField: false,
                  prefixIconAsset: 'assets/profile.png',
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                  controller: _fullnameController,
                  hintText: "Nama Lengkap",
                  isPasswordField: false,
                  prefixIconAsset: 'assets/profile.png',
                ),
                SizedBox(
                  height: 10,
                ),
                // FormContainerWidget(
                //   controller: _ageController,
                //   hintText: "Usia",
                //   isPasswordField: false,
                //   prefixIconAsset: 'assets/profile.png',
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                FormContainerWidget(
                  controller: _phoneNumberController,
                  hintText: "No HP",
                  isPasswordField: false,
                  prefixIconAsset: 'assets/call_reg.png',
                ),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                    controller: _emailController,
                    hintText: "Email",
                    isPasswordField: false,
                    prefixIconAsset: 'assets/mail.png'),
                SizedBox(
                  height: 10,
                ),
                FormContainerWidget(
                    controller: _passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                    prefixIconAsset: 'assets/lock.png'),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    final firestore = FirebaseFirestore.instance;
                    int countryCode = 62;
                    String phoneNumberText = _phoneNumberController.text ?? "";
                    // int completePhoneNumber = int.parse(countryCode.toString() + phoneNumberText.toString());
                    if (phoneNumberText.isNotEmpty) {
                      phoneNumberText = phoneNumberText.substring(1);
                    }
                    await firestore
                        .collection("users")
                        .doc(_emailController.text)
                        .set({
                      "username": _usernameController.text,
                      "fullname": _fullnameController.text,
                      // "age": int.tryParse(_ageController.text),
                      "PhoneNumber": int.tryParse("62" + phoneNumberText) ?? 0,
                      "email": _emailController.text,
                      "password": _passwordController.text,
                    });
                    _register();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: _isRegister
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isRegister = true;
    });
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isRegister = false;
    });

    if (user != null) {
      showToast(mesagge: "User is successfully created");
      Navigator.pushNamed(context, "/login", arguments: {'username': username});
    } else {
      showToast(mesagge: "some error happend");
    }
  }
}
