import 'package:flutter/material.dart';
import 'package:talabathub/componants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
            children: [
              category(),
              category(),
              category(),
            ],
        ),
      ),
    );
  }
}
