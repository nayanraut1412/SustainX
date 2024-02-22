import 'package:flutter/material.dart';
import 'package:trashpickup/pages/register.dart';
import 'package:trashpickup/pages/login.dart';
import 'package:trashpickup/pages/start.dart';
import 'package:trashpickup/pages/home.dart';
import 'package:trashpickup/pages/complete_pickup.dart';
import 'package:trashpickup/pages/pending_pickup.dart';
import 'package:trashpickup/pages/settings.dart';
import 'package:trashpickup/pages/notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TrashPickup',
      initialRoute: '/',
      routes: {
        '/': (context) => Start(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/complete_pickup': (context) => CompletePickup(),
        '/pending_pickup': (context) => PendingPickup(),
        '/settings': (context) => Settings(),
        '/notifications': (context) => Notifications(),
      },
    );
  }
}
