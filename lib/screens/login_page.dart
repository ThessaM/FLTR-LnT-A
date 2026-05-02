import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_fltr_lnt_a/blocs/auth_bloc.dart';
import 'package:main_fltr_lnt_a/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(state.userId),));
            }
          },
          builder: (context, state) {
              return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isLogin ? 'Login' : 'Register', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: .w600),),
                SizedBox(height: 20),
                TextField(controller: email, decoration: InputDecoration(labelText: 'Email',), style: TextStyle(color: Colors.white),),
                SizedBox(height: 20),
                TextField(controller: password, obscureText: true, decoration: InputDecoration(labelText: 'Password',), style: TextStyle(color: Colors.white)),
                SizedBox(height: 20),
                if(!isLogin) TextField(controller: phoneNumber, decoration: InputDecoration(labelText: 'Phone Number',), style: TextStyle(color: Colors.white),),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if(isLogin) {
                      context.read<AuthBloc>().add(LoginEvent(email.text, password.text));
                    } else {
                      context.read<AuthBloc>().add(RegisterEvent(email.text, password.text, phoneNumber.text));
                    }
                  },
                  child: Text(isLogin ? 'Login' : 'Register'),
                ),
                TextButton(
                  onPressed: () => setState(() => isLogin = !isLogin),
                  child: Text(isLogin ? 'Create account' : 'Already have account'),
                ),
                
                if (state is AuthError) Text(state.message, style: TextStyle(color: Colors.red),)
              ],
            );
          },
        )
      )
    );
  }
}