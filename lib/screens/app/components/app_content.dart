import 'package:flutter/material.dart';
import 'package:locker/constants.dart';


class AppContent extends StatelessWidget {
  const AppContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Smart Locker",
          style: TextStyle(
            color:Color(0xFF6F35A5),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: 300,
          width: 300,
        )
      ],
    );
  }
}
