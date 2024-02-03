import 'package:flutter/material.dart';
import 'package:sustain_x/pages/login.dart';

class Start extends StatelessWidget {
  const Start({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green,
      // ),
      body: Center(
        child: Container(
          width: 450,
          height: 990,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/layer.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
              child: Center(
            child: Container(

                // width: 380,
                // height: 790,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Background text with stroke
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                      child: Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 58,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // Foreground text
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 0.0),
                      child: Center(
                        child: Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 58,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(0.0, 155.0, 0.0, 0.0),
                      child: Center(
                        child: Text(
                          'To',
                          style: TextStyle(
                            fontSize: 58,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // Foreground text
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(0.0, 155.0, 0.0, 0.0),
                      child: Center(
                        child: Text(
                          'To',
                          style: TextStyle(
                            fontSize: 58,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(0.0, 230.0, 0.0, 0.0),
                      child: Center(
                        child: Text(
                          'SustainX',
                          style: TextStyle(
                            fontSize: 58,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Colors.black,
                          ),
                        ),
                      ),
                    ),
                    // Foreground text
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(0.0, 230.0, 0.0, 0.0),
                      child: Center(
                        child: Text(
                          'SustainX',
                          style: TextStyle(
                            fontSize: 58,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 5.0),
                    child: Image.asset(
                      'assets/images/recyclingwork.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0, 100.0, 0.0, 5.0),
                  child: Text(
                    'Plastics | Paper | Metals | Ewaste',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[500]),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_circle_right_rounded,
                      size: 50.0, // Adjust the size as needed
                      color: Color(0xFF1BE417),
                    ),
                    onPressed: () {
                      // Add your navigation logic here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(index: 0)),
                      );
                    },
                  ),
                ),
              ],
            )),
          )),
        ),
      ),
    );
  }
}
