import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'current_location_screen.dart';

class SchedulePickup extends StatefulWidget {
  const SchedulePickup({super.key});

  @override
  _SchedulePickupState createState() => _SchedulePickupState();
}

class _SchedulePickupState extends State<SchedulePickup> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  final CollectionReference pickupsCollection =
  FirebaseFirestore.instance.collection('pickups');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 00.0, horizontal: 0),
                child: Text(
                  'Schedule a Free Pickup',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 05.0, 0.0, 0.0),
                      child: Container(
                        //width: 220,
                        height: 65,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          onTap: () async {
                            await _selectDate(context);
                          },
                          controller: dateController,
                          readOnly: true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            labelText: "Select a pickup date",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.date_range_outlined),
                              onPressed: () async {
                                await _selectDate(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        height: 65,
                        child: TextField(
                          onTap: () async {
                            await _selectTime(context);
                          },
                          controller: timeController,
                          readOnly: true,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            labelText: "Add your preferred time",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.access_time_outlined),
                              onPressed: () async {
                                await _selectTime(context);
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 8.0),
                      child: Text(
                        'Confirm Pickup Location',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          // Navigate to the CurrentLocationScreen
                          final Position? position = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CurrentLocationScreen()),
                          );

                          // Handle the returned position
                          if (position != null) {
                            locationController.text =
                            'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
                            latitudeController.text = '${position.latitude}';
                            longitudeController.text = '${position.longitude}';
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                          child: Text(
                            'Get Current Location',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        height: 65,
                        child: TextField(
                          controller: locationController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.green),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(21),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            labelText: "Location",
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.home_work_outlined),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange[300],
                            onPrimary: Colors.black,
                            side: const BorderSide(color: Colors.black),
                          ),
                          onPressed: () async {
                            if (selectedDate == null ||
                                selectedTime == null ||
                                locationController.text.isEmpty) {
                              _showAlert(context,
                                  "Please fill all fields before scheduling pickup.");
                              return;
                            }

                            // Save pickup data to Firestore
                            await savePickupData();

                            // Use selectedDate and selectedTime as needed
                            String pickupDetails = '';
                            pickupDetails += 'Date: ${selectedDate!.toLocal()}';
                            pickupDetails +=
                            '\nTime: ${selectedTime!.format(context)}';
                            pickupDetails +=
                            '\nLocation: ${locationController.text}';
                            print(pickupDetails);

                            Navigator.pushNamed(context, '/success');
                          },
                          child: const Text(
                            'Schedule Pickup',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> savePickupData() async {
    try {
      await pickupsCollection.add({
        'date': selectedDate!.toLocal(),
        'time': selectedTime!.format(context),
        'location': locationController.text,
        'latitude': latitudeController.text,
        'longitude': longitudeController.text,
        'status' : 'Pending',
      });
    } catch (error) {
      print("Error saving pickup data: $error");
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
        timeController.text = pickedTime.format(context);
      });
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