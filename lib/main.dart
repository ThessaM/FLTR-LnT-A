import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/app_theme.dart';
import 'package:main_fltr_lnt_a/firebase_options.dart';
import 'package:main_fltr_lnt_a/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: LoginPage()
    );
  }
}
