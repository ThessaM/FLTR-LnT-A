import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_bloc.dart';
import 'package:main_fltr_lnt_a/bloc/login_event.dart';
import 'package:main_fltr_lnt_a/bloc/login_state.dart';
import 'package:main_fltr_lnt_a/home_page.dart';

class LoginPage extends StatelessWidget {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if(state is LoginSuccess){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage(),));
            } else if (state is LoginError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message))
              );
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage(),));
            }
          },

          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(labelText: "Username"),
                ),
            
                SizedBox(height: 10),
            
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password"),
                ),
            
                SizedBox(height: 20),

                if(state is LoginLoading) CircularProgressIndicator()
                else ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted(usernameController.text, passwordController.text));
                    },
                    child: Text("Login"),
                  ),  
              ],
            );
          }
        ),
      )
    );
  }
}