import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                    child: Text(
                      'Pickup Scheduled',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.black,
                      ),
                    ),
                  ),
                ),
                // Foreground text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                    child: Text(
                      'Pickup Scheduled',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1BE417),
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                    child: Text(
                      'Successfully!',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 1
                          ..color = Colors.black,
                      ),
                    ),
                  ),
                ),
                // Foreground text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                    child: Text(
                      'Successfully!',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1BE417),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
                  child: Lottie.asset(
                    'assets/animations/done_animation.json',
                    width: 490,
                    // height: 490,

                    repeat: false,
                    fit: BoxFit.contain,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 650.0),
                  child: Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).popUntil((route) => route.isFirst);
                              Navigator.pushNamed(context, '/home');
                            },
                            icon: Icon(Icons.home, size: 40, color: Colors.black),
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green[50],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
