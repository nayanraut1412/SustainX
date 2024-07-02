import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sustain_x/pages/personal_details.dart';
import 'package:sustain_x/components/my_textfield.dart';
import 'package:sustain_x/components/my_button.dart';
import '../../services/auth_service.dart';
import '../current_location_screen.dart';
//import 'home.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register({super.key, required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  final CollectionReference personalDetailsCollection =
  FirebaseFirestore.instance.collection('users');

  // sign user up method
  Future signUserUp() async {
    // show loading cycle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // try creating the user
    try {
      if (passwordController.text == confirmpasswordController.text) {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Update display name with full name
        await userCredential.user!.updateDisplayName(_fullNameController.text);

        // Save user data to Firestore
        await personalDetailsData();

        Navigator.pop(context); // Close the loading dialog

      } else {
        showErrorMessage("Passwords don't match!");
      }
      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
          child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                    width: double.infinity,
                    // height: 700,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            // Background text with stroke
                            Text(
                              'Register',
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
                              'Register',
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
                          controller: _fullNameController,
                          labelText: "Full Name",
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

                              SizedBox(height: 5.0,),

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
                
                        MyTextField(
                          controller: emailController,
                          labelText: "Email",
                          // hintText: 'Enter your Email',
                          obscureText: false,
                        ),
                
                        // const SizedBox(height: 10,),
                
                        // password TextField
                        MyTextField(
                          controller: passwordController,
                          labelText: 'Password',
                          obscureText: true,
                        ),
                
                        // const SizedBox(height: 10,),
                
                        // confirm password TextField
                        MyTextField(
                          controller: confirmpasswordController,
                          obscureText: true,
                          labelText: 'Confirm Password',
                        ),
                
                        const SizedBox(height: 20,),
                
                        MyButton(
                          onTap: signUserUp,
                          text: "Sign Up",
                        ),
                
                        SizedBox(height: 10.0,),
                
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Text(
                              'Or continue with',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                
                        GestureDetector(
                          onTap: () => AuthService().signInWithGoogle(),
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: Image.asset(
                                        'assets/images/google.png',
                                        width: 30,
                                        height: 30,
                                      ),
                                    ),
                                    Text(
                                      'Sign up with Google',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                border: Border.all(color: Colors.black),
                                color: Colors.orange[300],
                              ),
                            ),
                        ),
                
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text(
                                "Login Now",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                ),
              ),
          ),
        )
    );
  }

  Future<void> personalDetailsData() async {
    try {
      await personalDetailsCollection.add({
        'full name': _fullNameController.text,
        'phone no': _phoneNumberController.text,
        'address': _addressController.text,
        'email': emailController.text,
      });
    } catch (error) {
      print("Error saving user data: $error");
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
