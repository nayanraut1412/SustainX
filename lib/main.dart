import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:sustain_x/pages/cost_calculation.dart';
import 'package:sustain_x/pages/notification.dart';
import 'package:sustain_x/pages/pickup_history.dart';
import 'package:sustain_x/pages/home.dart';
import 'package:sustain_x/pages/price_enquiry.dart';
import 'package:sustain_x/pages/schedule_pickup.dart';
import 'package:sustain_x/pages/settings.dart';
import 'package:sustain_x/pages/success_page.dart';

import 'classifier.dart';
import 'package:sustain_x/pages/user_auth_pages/auth_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SustainX',
      home: AuthPage(),
      // initialRoute: '/login',
      routes: {
        // '/' : (context) => Start(),
        '/home' : (context) => Home(),
        '/settings' : (context) => Settings(),
        '/price_enquiry' : (context) => Price_Enquiry(),
        '/schedule_pickup' : (context) => SchedulePickup(),
        '/success' : (context) => SuccessPage(),
        '/notifications' : (context) => Notifications(),
        '/cost_calculation' : (context) => CostCalculation(),
        '/pickup_history' : (context) => PickupHistory(),
        // '/image_classification' : (context) => ImageClassificationApp(),
        '/image_classification' : (context) => BottomNavigationBarExample(),
        '/auth_page' : (context) => AuthPage(),
      },
    );
  }
}
