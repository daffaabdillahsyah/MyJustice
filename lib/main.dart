import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:myjustice2/features/app/splash_screen/splash_screen.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/home_page.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/login_page.dart';
import 'package:myjustice2/features/user_auth/presentation/pages/register_page.dart';
import 'package:myjustice2/firebase_options.dart';
// import 'package:myjustice2/features/app/splash_screen/splash_screen.dart';
// import 'package:myjustice2/firebase_options.dart';
// import 'features/user_auth/presentation/pages/login_page.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      home: SplashScreen(child: LoginPage()),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
