import 'package:flutter/material.dart';

import 'package:wallter/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper God',
      theme: ThemeData(
primaryColor: Colors.blue,

  
      ),
      home: const HomeScreen(),
    );
  }
}
