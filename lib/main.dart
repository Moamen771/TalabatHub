import 'package:flutter/material.dart';
import 'package:talabathub/firebase_options.dart';
import 'package:talabathub/loging/authentication.dart';
import 'package:talabathub/loging/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:talabathub/loging/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TalabatHub());
}

class TalabatHub extends StatelessWidget {
  const TalabatHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Auth(),
        'SignUP': (context) => const SignUpPage(),
        'LogIN': (context) => const LoginPage(),
      },
    );
  }
}
