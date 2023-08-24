import 'package:fire/Login.dart';
import 'package:fire/Signup.dart';
import 'package:flutter/material.dart';
class AuthPage extends StatefulWidget{
  @override
  // ignore: library_private_types_in_public_api
  _AuthPageState createState()=> _AuthPageState();
}

class _AuthPageState extends State<AuthPage>{
  bool isLogin =true;
  @override
  Widget build(BuildContext context) =>
    // TODO: implement build
    isLogin ? LoginPage() : SignupPage();
    void toggle()=> setState (()=> isLogin= !isLogin);
  }

