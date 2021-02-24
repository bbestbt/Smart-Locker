
import 'package:flutter/material.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/booked/booked_screen.dart';
import 'package:locker/screens/homepage/home_screen.dart';
import 'package:locker/screens/sign_in/sign_in_screen.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class DetailScreen extends StatelessWidget {
  final location;

  DetailScreen(this.location);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF6F35A5),
      body: SingleChildScrollView(
        child: Container(width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(height: 250,
            width: MediaQuery.of(context).size.width,
            child: Stack(fit: StackFit.expand,
              children: [
                Image.asset('assets/images/locker.jpg',
                fit: BoxFit.fill,
                ),
                Container(
                  width:MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.purple.withOpacity(0.1),
                ),

              ],
              ),

            ),
            Positioned(top:50,left: 20,child: IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
               onPressed: (){
              Navigator.pop(context);
            }),)
            
          ],
        ),
        ),
        // child: SafeArea(
        //   child: Column(
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             IconButton(
        //               icon: Icon(
        //                 Icons.arrow_back_ios,
        //                 color: Color(0xFFF1E6FF),
        //               ),
        //               onPressed: () {
        //                 Navigator.pushNamed(context, HomeScreen.routeName);
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
