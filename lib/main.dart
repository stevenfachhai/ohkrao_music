import 'package:flutter/material.dart';
import 'package:siaramo_music/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Siaramo Music',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false, // This removes the debug banner
    );
  }
}
