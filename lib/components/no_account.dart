import 'package:flutter/material.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/forgot_password/forgot_password_screen.dart';
import 'package:locker/screens/sign_up/sign_up_screen.dart';
import 'package:locker/size_config.dart';

class NoAccount extends StatelessWidget {
  const NoAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have account ? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(15)),
        ),
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, SignUpScreen.routeName),
            child: Text("Sign up ",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold))),
      ],
    );
  }
}
