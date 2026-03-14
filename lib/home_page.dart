import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_event.dart';
import 'package:main_fltr_lnt_a/bloc/login_state.dart';
import 'package:main_fltr_lnt_a/login_page.dart';
import 'package:main_fltr_lnt_a/profile_page.dart';
import 'package:main_fltr_lnt_a/utils/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInitial) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage(),));
        }
      },
      child: Scaffold(
        body: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if(state is LoginSuccess) {
                return Column(
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
                
                    SizedBox(height: 12,),
                
                    ElevatedButton.icon(
                      label: Text("Logout"),
                      icon: Icon(Icons.logout_rounded),
                      onPressed: () {
                      context.read<LoginBloc>().add(LogoutRequested());
                    },)
                  ],
                );
              } else {
                return Text("Error Page");
              }
            } 
          ),
        ),
      ),
    );
  }
}