import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
        'Account',
          style: TextStyle(
          fontSize: 50
        ),
        ),
      ),
    );
  }
}