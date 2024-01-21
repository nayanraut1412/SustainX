import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//void main() => runApp(const Sample1());

class Sample1 extends StatelessWidget {
  const Sample1({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            // Load a Lottie file from your assets
            //Lottie.asset('assets/LottieLogo1.json'),

            // Load a Lottie file from a remote url
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
              child: Lottie.network(
                'https://lottie.host/ce8987ae-bbcd-417e-ba30-8d220a705db1/f8MQLoWPaO.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Lottie.network(
                'https://lottie.host/91b357ab-500b-44f0-a239-3c9b508fbd7d/4bYbqWQ5ub.json',
                width: 400,
                height: 400,
                fit: BoxFit.contain,
              ),
              //),  https://lottie.host/b88c4ff3-7fd8-4520-9c2b-7f974593b5d5/GaY8PMdMri.json

              // ),

              // padding: const EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),

              // ),

              // Load an animation and its images from a zip file
              //     Lottie.asset(
              //   'assets/animations/Animation - 1705746548837.json',
              //   width: 100,
              //   height: 100,
              //   fit: BoxFit.fill,
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
