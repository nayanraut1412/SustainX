import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
          child: Text(
            'Hello, Nayan!',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 35.0,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  'Nayan Raut \nnayanraut1412@gmail.com',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 30.0),
                  child: Container(
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 20.0),
                              child: Image.asset(
                                'assets/images/Verification.png',
                                width: 80,
                                height: 80,
                              )),
                        ),
                        Expanded(
                          child: Text(
                            '12',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/complete_pickup');
                              },
                              child: Text(
                                'Completed Pickups',
                                textAlign: TextAlign.center,
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.green),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 05.0, vertical: 05.0),
                  child: Container(
                    width: 150.0,
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 20.0),
                            child: Image.asset('assets/images/Expired.png'),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '5',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/pending_pickup');
                              },
                              child: Text(
                                'Pending Pickups',
                                textAlign: TextAlign.center,
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.green),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            //SizedBox(height: 2),
            Center(
              child: Image.asset(
                'assets/images/pickupboy.png',
                width: 230,
                height: 210,
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
            currentIndex: 0,
            onTap: (int index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/home');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/notifications');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/settings');
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
