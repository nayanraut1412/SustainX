import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Sample1 extends StatelessWidget {
  const Sample1({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            // Your Lottie animations
            Positioned(
              top: 100.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.network(
                  'https://lottie.host/ce8987ae-bbcd-417e-ba30-8d220a705db1/f8MQLoWPaO.json',
                  width: 400,
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: 400.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.network(
                  'https://lottie.host/91b357ab-500b-44f0-a239-3c9b508fbd7d/4bYbqWQ5ub.json',
                  width: 400,
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Add other widgets here if needed
          ],
        ),
      ),
    );
  }
}
