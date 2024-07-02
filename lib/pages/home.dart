import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<String> getUserName() async {
    final email = user.email; // Get the email of the current user
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    // if (querySnapshot.docs.isNotEmpty) {
    //   // If a document with matching email is found
    //   final userData = querySnapshot.docs.first.data();
    //   final fullName = userData['full name']; // Assuming 'fullName' is the field containing the full name
    //   return fullName.toString();
    // } else {
      return 'User'; // Return a default value if user not found or fullName is not available
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
        title: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 0.0, 10.0),
          child: FutureBuilder(
            future: getUserName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // While waiting for the future to complete, show a loading indicator or placeholder
                return CircularProgressIndicator(); // Placeholder example
              } else {
                // Once the future is complete, show the 'Hello' text with the user's full name
                if (snapshot.hasError) {
                  return Text(
                    'Hello, User',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  );
                } else {
                  return Text(
                    'Hello, ${snapshot.data ?? 'User'}',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }
              }
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 05.0),
              child: Text(
                'Choose a Service',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Container(
                    width: 150.0,
                    height: 230.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                            child: Image.asset('assets/images/truck.png'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/schedule_pickup');
                              },
                              child: Text(
                                'Schedule a Free Pickup',
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
                  padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Container(
                    width: 150.0,
                    height: 230.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                            child: Image.asset('assets/images/rupee.png'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/price_enquiry');
                              },
                              child: Text(
                                'Price Enquiry',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 05.0, vertical: 5.0),
                  child: Container(
                    width: 150.0,
                    height: 230.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20.0),
                            child: Image.asset('assets/images/calculate.png'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/cost_calculation');
                              },
                              child: Text(
                                'Price Your Trash',
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
                      horizontal: 05.0, vertical: 5.0),
                  child: Container(
                    width: 150.0,
                    height: 230.0,
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
                            child: Image.asset('assets/images/order.png'),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/pickup_history');
                              },
                              child: Text(
                                'My Pickups History',
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/image_classification');
                    },
                    child: Text(
                      'Use Camera to Classify Your Trash',
                      textAlign: TextAlign.center,
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.green),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                    ),
                  ),
                )
              ],
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
