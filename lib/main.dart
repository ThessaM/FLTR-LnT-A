import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/screens/login_page.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.black,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 1,
        ),

        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[900],
          labelStyle: TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
        ),

        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          ),
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white70,
        ),
      ),
      home: LoginPage(),
    );
  }
}
