import 'package:flutter/material.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/booked/booked_screen.dart';
import 'package:locker/screens/booked/components/body.dart';
import 'package:locker/screens/homepage/home_screen.dart';
import 'package:locker/screens/sign_in/sign_in_screen.dart';


const locationData = [
  {
    'Branch': 'Siam',
    'Address': 'Lorem ipsum dolor nt',
    'Rating': '4.4',
    'bg': Color(0xFFBAE1FF),
  },
  {
    'Branch': 'Siam',
    'Address': 'Lorem ipsum dosssunt',
    'Rating': '4.4',
    'bg': Color(0xFFB5DDD1),
  },
  {
    'Branch': 'Siam',
    'Address': 'Lorem ipsum idunt',
    'Rating': '4.4',
    'bg': Color(0xFFD7E7A9),
  },
  {
    'Branch': 'Siam',
    'Address': 'or incididunt',
    'Rating': '4.4',
    'bg': Color(0xFFD3C0F9),
  },
  {
    'Branch': 'Siam',
    'Address': 'Letincididunt',
    'Rating': '4.4',
    'bg': Color(0xFFF99A9C),
  },
  {
    'Branch': 'Siam',
    'Address':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
    'Rating': '4.4',
    'bg': Color(0xFFFDBCCF),
  },
];

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6F35A5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFFF1E6FF),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color(0xFFF1E6FF),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Location",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      LocationCard(locationData[0]),
                      LocationCard(locationData[1]),
                      LocationCard(locationData[2]),
                      LocationCard(locationData[3]),
                      LocationCard(locationData[4]),
                      LocationCard(locationData[5]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final location;
  LocationCard(this.location);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right:5),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      height:100,
      decoration: BoxDecoration(
        color: location['bg'],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 35, left: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location['Branch'],
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Spacer(flex: 2),
                // Text(location['Address'],style: TextStyle(),
                // ),
                SizedBox(height: 10),

                MaterialButton(
                  onPressed: () {
                   // Navigator.pushNamed(context, BookedScreen.routeName);
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>
                    DetailScreen(location)));
                  },
                  color: Color(0xFFF1E6FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text("View details",
                  style: TextStyle(),
                ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
