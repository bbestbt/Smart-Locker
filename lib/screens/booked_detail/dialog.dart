import 'package:flutter/material.dart';

enum DialogAction { yes}

class Dialogs {
  static Future<DialogAction> yesDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFFF1E6FF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          title: Text(title,
              style: TextStyle(
              
                fontWeight: FontWeight.bold,
                color: Color(0xFF6F35A5),
              )),
          content: Text(
            body,
            style: TextStyle(
            
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(DialogAction.yes),
              child: Text(
                'OK',
                style: TextStyle(
                  
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6F35A5)),
              ),
            ),
           
          ],
        );
      },
    );
  }
  }