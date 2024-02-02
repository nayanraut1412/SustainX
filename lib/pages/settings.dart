<<<<<<< HEAD
import 'package:flutter/material.dart';

import 'home.dart';

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
      body: Container(),
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
            onTap: (int index){
              switch (index){
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home(index: 0,)),
                  );
                  break;
                // case 1:
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Notifications(index: 1,)),
                //   );
                //   break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings(index: 2,)),
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
=======
import 'package:flutter/material.dart';

import 'home.dart';

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
      body: Container(),
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
            onTap: (int index){
              switch (index){
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home(index: 0,)),
                  );
                  break;
                // case 1:
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => Notifications(index: 1,)),
                //   );
                //   break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings(index: 2,)),
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
>>>>>>> parent of 62fe02b (Modified Settings.dart)
