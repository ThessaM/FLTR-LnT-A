import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_bloc.dart';
import 'package:main_fltr_lnt_a/login_page.dart';
import 'package:main_fltr_lnt_a/utils/app_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
      
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.emerald, // Emerald green
          ),
      
          scaffoldBackgroundColor: AppColors.background,
      
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
      
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor:  AppColors.emerald,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
      
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
      
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
      
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
      
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
      
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: AppColors.emerald,
                width: 2,
              ),
            ),
          ),
        ),
        home: LoginPage(),
      ),
    );
  }
}