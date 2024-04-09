import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../components/my_textfield.dart';
import 'current_location_screen.dart';

class PersonalDetails extends StatefulWidget {
  final String email;

  const PersonalDetails({super.key, required this.email});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails>{

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final CollectionReference personalDetailsCollection =
  FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
          child: SingleChildScrollView(
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          // Background text with stroke
                          Text(
                            'Personal Details',
                            style: TextStyle(
                              fontSize: 38,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 2
                                ..color = Colors.black,
                            ),
                          ),
                          // Foreground text
                          Text(
                            'Personal Details',
                            style: TextStyle(
                              fontSize: 38,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1BE417),
                            ),
                          ),
                        ],
                      ),

                      MyTextField(
                        controller: _firstNameController,
                        labelText: "First Name",
                        obscureText: false,
                      ),

                      MyTextField(
                        controller: _lastNameController,
                        labelText: "Last Name",
                        obscureText: false,
                      ),

                      MyTextField(
                        controller: _phoneNumberController,
                        labelText: "Phone No.",
                        obscureText: false,
                      ),

                      Container(
                        child: Column(
                          children: [

                            MyTextField(
                              controller: _addressController,
                              labelText: "Address",
                              obscureText: false,
                            ),

                            SizedBox(height: 10.0,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                OutlinedButton(
                                  onPressed: () async {
                                    // Navigate to the CurrentLocationScreen
                                    final Position? position = await Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => CurrentLocationScreen()),
                                    );

                                    // Handle the returned position
                                    if (position != null) {
                                      // Update locationController with received location data
                                      _addressController.text =
                                      'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    ),
                                    side: BorderSide(
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 10.0),
                                    child: Text(
                                      'Get Your Current Location',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 80.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.orange[300],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(17.0),
                                ),
                                side: BorderSide(
                                  width: 1,
                                ),
                              ),
                              onPressed: () async {
                                if (_firstNameController.text.isEmpty ||
                                    _lastNameController.text.isEmpty ||
                                    _addressController.text.isEmpty ||
                                    _phoneNumberController.text.isEmpty) {
                                  _showAlert(context,
                                      "Please fill all fields before moving further.");
                                  return;
                                }

                                // Save pickup data to Firestore
                                await personalDetailsData();

                                Navigator.pop(context);
                                Navigator.pushNamed(context, '/home');
                              },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              ),
          ),
        )
    );
  }

  Future<void> personalDetailsData() async {
    try {
      await personalDetailsCollection.add({
        'first name': _firstNameController.text,
        'last name': _lastNameController.text,
        'phone no': _phoneNumberController.text,
        'address': _addressController.text,
        'email': widget.email,
      });
    } catch (error) {
      print("Error saving user data: $error");
      // Handle error
    }
  }

  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
