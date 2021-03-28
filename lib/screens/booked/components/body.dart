import 'package:flutter/material.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/booked/booked_screen.dart';
import 'package:locker/screens/booked/dialog.dart';
import 'package:locker/screens/booked_detail/bookdetail_screen.dart';
import 'package:locker/screens/homepage/home_screen.dart';
import 'package:locker/screens/sign_in/sign_in_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

var lockerList = [
  {'title': 'Locker1', 'price': 30},
  {'title': 'Locker2', 'price': 50},
  {'title': 'Locker3', 'price': 75},
  {'title': 'Locker4', 'price': 20},
];

class DetailScreen extends StatelessWidget {
  final location;

  DetailScreen(this.location);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF6F35A5),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/locker.jpg',
                      fit: BoxFit.fill,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.purple.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3 - 30,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(height: 30),
                        Locker(lockerList[0]),
                        Locker(lockerList[1]),
                        Locker(lockerList[2]),
                        Locker(lockerList[3]),
                      ],
                    ),
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

class Locker extends StatelessWidget {
  final locker;
  Locker(this.locker);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 - 40,
                child: Text(
                  locker['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
          Text(
            '${locker['price']} Baht',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          MaterialButton(
            onPressed: () {
               Navigator.push(context,MaterialPageRoute(builder: (context)=>
                    BookDetailScreen()));
              //display error (booked)
             // showAlertDialog(context);
            },
            color: Colors.purple,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Book",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
