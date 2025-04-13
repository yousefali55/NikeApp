import 'package:flutter/material.dart';
import 'package:nike/features/screens/test_screen.dart';

class NikeApp extends StatelessWidget {
  const NikeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TestScreen(),
      ),
    );
  }
}