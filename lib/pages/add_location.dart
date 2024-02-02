import 'package:flutter/material.dart';
import 'package:sustain_x/pages/home.dart';

//import 'home.dart';

class Addlocation extends StatelessWidget {
  const Addlocation({Key? key, required this.index}) : super(key: key);

  final int index;

  //TextEditingController myController()=> _ToDoPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:
            //const Padding(
            //   padding: EdgeInsets.all(30.0),
            //   child: Text('Add Location',style: TextStyle(fontSize: 40,fontFamily: 'Poppins',fontWeight: FontWeight.w500,color: Colors.green),),
            // )
            Center(
                child: SingleChildScrollView(
                    child: Container(
                        width: 380,
                        height: 700,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                // Background text with stroke
                                Text(
                                  'Add Location',
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
                                  'Add Location',
                                  style: TextStyle(
                                    fontSize: 38,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF1BE417),
                                  ),
                                ),
                              ],
                            ),

                            // Container(height: 30,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 30.0, 0.0, 0.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21),
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  labelText: "State",
                                  hintText: 'Enter your state',
                                ),
                              ),
                            ),

                            // Container(height: 20,),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //padding: EdgeInsets.fromLTRB(10.0, 10.0, 55.0, 10.0),

                                    Container(
                                      width: 185,
                                      height: 075,
                                      child: //Padding(
                                          //padding: const EdgeInsets.fromLTRB(00.0, 0.0, 180.0, 0.0),
                                          // child:
                                          TextField(
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              borderSide: BorderSide(
                                                  color: Colors.green)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          labelText: "City",
                                          hintText: 'Enter your city',
                                        ),
                                      ),
                                    ),

                                    Container(
                                      width: 180,
                                      height: 075,
                                      child: //Padding(
                                          //padding: const EdgeInsets.fromLTRB(00.0, 0.0, 180.0, 0.0),
                                          // child:
                                          TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              borderSide: BorderSide(
                                                  color: Colors.green)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                              borderSide: BorderSide(
                                                  color: Colors.black)),
                                          labelText: "Pin Code",
                                          hintText: 'Enter your pin code',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //Container(height: 10,),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21),
                                      borderSide:
                                          BorderSide(color: Colors.green)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(21),
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  labelText: "Address",
                                  hintText: 'Enter your address',
                                  //hoverColor: Colors.green,
                                ),
                              ),
                            ),

                            //Container(height: 20,),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Select Your Location',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ),

                            Container(
                              height: 8,
                            ),
                            Image.asset('assets/images/map1.png'),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    290.0, 20.0, 0.0, 0.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary:
                                        Colors.orange[300], // Background color
                                    onPrimary: Colors.black, // Text color
                                    side: BorderSide(
                                        color: Colors.black), // Border color
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home(
                                                index: 0,
                                              )),
                                    );
                                  },
                                  //},
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                )),
                          ],
                        )))));
  }
}
