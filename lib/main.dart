
import 'package:flutter/material.dart';
import 'package:talabathub/pages/main_home.dart';

void main(){
  runApp(const TalabatHub());
}

class TalabatHub extends StatelessWidget {
  const TalabatHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
