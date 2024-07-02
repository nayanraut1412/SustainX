import 'package:flutter/material.dart';
import 'package:sustain_x/pages/user_auth_pages/login.dart';
import 'package:sustain_x/pages/user_auth_pages/register.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  // initially shoe login page
  bool showLoginPage = true;

  // toggle between login and register page
  void togglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return Login(onTap: togglePages);
    }else{
      return Register(
        onTap: togglePages,
      );
    }
  }
}
