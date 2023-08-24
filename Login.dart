import 'package:fire/Signup.dart';
import 'package:fire/main.dart';
import 'package:flutter/material.dart';
import 'package:fire/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final   _emailController = TextEditingController();
  final _passwordController = TextEditingController();
@override
void dispose(){
  _emailController.dispose();
 _passwordController.dispose();
 super.dispose();
}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                login();
                  Navigator.push(
                  context,
            MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Login'),
            ),
             ElevatedButton(
              onPressed: (){
                 Navigator.push(
                  context,
            MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
        
              
              child: Text('SignUp'),
            ),
          ],
        ),
      ),
    );
  }
  Future login() async{
    showDialog(context: context,barrierDismissible: false, 
    builder: (context)=> Center(child: CircularProgressIndicator()));
    try {await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
  } on FirebaseAuthException catch (e){
    print(e);
  }
  navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }
}