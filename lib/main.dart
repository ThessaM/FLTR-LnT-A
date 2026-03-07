import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/ProductPage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ProductPage()
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
