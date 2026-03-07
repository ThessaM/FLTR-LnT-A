import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/ProductPage.dart';
import 'package:main_fltr_lnt_a/provider/CartProvider.dart';
import 'package:main_fltr_lnt_a/provider/UserProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cartprovider(),),
        ChangeNotifierProvider(create: (context) => Userprovider(),)
      ],
      child: MaterialApp(
        home: Scaffold(
          body: ProductPage()
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
