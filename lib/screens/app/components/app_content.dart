import 'package:flutter/material.dart';
import 'package:locker/constants.dart';

import '../../../size_config.dart';

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
            color: kPrimaryColor,
            fontSize: getProportionateScreenWidth(36),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
