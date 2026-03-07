import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/ProductPage.dart';
import 'package:main_fltr_lnt_a/provider/UserProvider.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("Login Page"),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 25, vertical: 25),
              child: TextField(
                decoration: InputDecoration(
                  label: Text("Username"),
                  border: OutlineInputBorder()
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Userprovider>().login(username);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
              child: Text("Login", style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
