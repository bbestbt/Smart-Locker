import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/app/components/app_content.dart';
import 'package:locker/screens/sign_in/sign_in_screen.dart';
import 'package:locker/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child:
                  //  PageView.builder(itemBuilder:(context,index)=>SplashContent(
                  //    image:"assets/images/splash_1.png",
                  //    text:"Welcome to Smart Locker",
                  //  ), )
                  AppContent(
                image: "assets/images/splash_1.png",
                text: "Welcome to Smart Locker",
              ),
            ),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      Spacer(
                        flex: 3,
                      ),
                      DefaultButton(
                        text:"Get start",
                        press:(){
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

