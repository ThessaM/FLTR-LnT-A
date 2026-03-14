import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/profile_page.dart';
import 'package:main_fltr_lnt_a/utils/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: AppColors.emerald,
              size: 80,
            ),

            SizedBox(height: 20),

            Text(
              "Login Successful!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text("View Profile"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfilePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}