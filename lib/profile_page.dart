

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_event.dart';
import 'package:main_fltr_lnt_a/bloc/login_state.dart';
import 'package:main_fltr_lnt_a/utils/app_color.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void showEditProfileDialog(BuildContext context, String currentUsername) {

    final usernameController = TextEditingController(text: currentUsername);
    final passwordController = TextEditingController();

    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Edit Profile"),
        content: Column(
          mainAxisSize: .min,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Username"
              ),
            ),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "New Password"
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () {
            Navigator.pop(context);
          }, child: Text("Cancel")),

          ElevatedButton(onPressed: () {
            context.read<LoginBloc>().add(
              UpdateProfile(usernameController.text, passwordController.text)
            );
            Navigator.pop(context);
          }, child: Text("Save"))
        ],
      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),

      body: Center(
        child: BlocBuilder<LoginBloc, LoginState>(

          builder: (context, state) {
            if(state is LoginSuccess) {
              return Column(
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
                    state.username,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(onPressed: () {
                    showEditProfileDialog(context, state.username);
                  }, child: Text("Edit Profile"))

                ],
              );
            } else {
              return Text("Error Page");
            }
          } 
        ),
      ),
    );
  }
}