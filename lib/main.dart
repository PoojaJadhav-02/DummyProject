import 'package:flutter/material.dart';

import 'screens/create_account_screen.dart';

void main() {
  runApp(const ReviveApp());
}

class ReviveApp extends StatelessWidget {
  const ReviveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revive the World',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        splashColor: const Color(0x142DCC70),
        highlightColor: const Color(0x102DCC70),
      ),
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(child: CreateAccountScreen()),
      ),
    );
  }
}