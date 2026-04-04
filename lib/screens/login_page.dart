import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isLogin ? 'Login' : 'Register', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: .w600),),
            SizedBox(height: 20),
            TextField(controller: email, decoration: InputDecoration(labelText: 'Email',), style: TextStyle(color: Colors.white),),
            SizedBox(height: 20),
            TextField(controller: password, obscureText: true, decoration: InputDecoration(labelText: 'Password',), style: TextStyle(color: Colors.white)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text(isLogin ? 'Login' : 'Register'),
            ),
            TextButton(
              onPressed: () => setState(() => isLogin = !isLogin),
              child: Text(isLogin ? 'Create account' : 'Already have account'),
            ),
            
          ],
        )
      )
    );
  }
}