

import 'package:flutter/material.dart';
import 'package:main_fltr_lnt_a/utils/app_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.emerald,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 16),

            Text(
              "username",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}