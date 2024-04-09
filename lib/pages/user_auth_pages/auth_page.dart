import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sustain_x/pages/home.dart';
import 'package:sustain_x/pages/personal_details.dart';
import 'login_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check if user is logged in
          if (snapshot.hasData) {
            final User? user = snapshot.data;
            if (user != null) {
              // Check if user details are completed
              if (snapshot.hasData) {
                // Redirect to home page if user is logged in and details are completed
                return Home();
              } else {
                // If user is logged in but details are not completed, return the AddLocationPage
                return PersonalDetails(email: '${user.email}');
              }
            }
          }
          // If there's no user logged in or user is null, return LoginOrRegisterPage
          return LoginOrRegisterPage();
        },
      ),
    );
  }
}