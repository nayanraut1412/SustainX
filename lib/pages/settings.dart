import 'package:flutter/material.dart';
import 'home.dart';
import 'package:sustain_x/pages/notification.dart';

class Settings extends StatelessWidget {
  const Settings({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Profile',
          style: TextStyle(
            fontSize: 28,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                radius: 40.0,
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Name',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  'Ninad Lunge',
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Address',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Near Jan Sangram Printing Press, Gond Plot, Ward No.20, Wardha',
                    // textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Contact Number',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  '+91 9405908266',
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 370.0,
              height: 60.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.0),
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  'niandlunge@gmail.com',
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Container(
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
            currentIndex: 2,
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(
                              index: 0,
                            )),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Notifications(
                              index: 1,
                            )),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Settings(
                              index: 2,
                            )),
                  );
                  break;
              }
            },
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.green,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
            border: Border.all(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
