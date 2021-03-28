import 'package:flutter/material.dart';
import 'package:locker/screens/booked/booked_screen.dart';

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
         Navigator.of(context).pop();      
         },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ERROR"),
    content: Text("Locker already booked."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}