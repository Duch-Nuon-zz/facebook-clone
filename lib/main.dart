import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(SocialApp());
}

class SocialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
