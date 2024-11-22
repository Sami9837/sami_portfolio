import 'package:flutter/material.dart';
import 'package:sami_4th_task/pages/home_page.dart';
import 'package:sami_4th_task/styles/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kCustomTheme,
      title: 'Sami Portfolio',
      home: const HomePage(),
    );
  }
}
