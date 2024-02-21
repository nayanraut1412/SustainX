import 'package:flutter/material.dart';

class PendingPickup extends StatelessWidget {
  const PendingPickup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PendingData> pendingDataList = [
      PendingData(
          name: 'Nayan Raut',
          address: 'Karla Road \n Wardha',
          date: '15 Jan 2024'),
      PendingData(
          name: 'Shrawani Gulkari',
          address: 'New Road \n Wardha',
          date: '15 Feb 2024'),
      PendingData(
          name: 'Ninad Lunge',
          address: 'Known Road \n Wardha',
          date: '15 March 2024'),
      PendingData(
          name: 'Ninad Lunge',
          address: 'Known Road \n Wardha',
          date: '15 March 2024'),
      PendingData(
          name: 'Ninad Lunge',
          address: 'Known Road \n Wardha',
          date: '15 March 2024'),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0),
                child: Text(
                  'Pending Pickup',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28.0,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: pendingDataList.length,
                itemBuilder: (context, index) {
                  return PendingWidget(data: pendingDataList[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PendingData {
  final String name, address, date;

  PendingData({required this.name, required this.address, required this.date});
}

class PendingWidget extends StatelessWidget {
  final PendingData data;

  const PendingWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 1), // Stroke
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                height: 10,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: ' ${data.name} \n ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Address: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '${data.address} \n ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: 'Pickup Date: ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '${data.date}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 190,
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.orange[300], // Text color
                      side: BorderSide(color: Colors.black), // Border color
                      shadowColor: Colors.grey, // Shadow color
                      elevation: 5,
                      // Elevation (controls the intensity of the shadow)
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15), // Border radius
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Open with map',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset(
                            'assets/images/google-maps.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
