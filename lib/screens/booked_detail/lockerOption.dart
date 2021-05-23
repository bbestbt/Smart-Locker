import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:locker/components/default_button.dart';
import 'package:locker/screens/payment/card/credit.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LockerOption extends StatefulWidget {
  @override
  _LockerOptionState createState() => _LockerOptionState();
}

class _LockerOptionState extends State<LockerOption> {
  String userName = '';
  int lockerId;
  String email = '';
  var price;
  Future stopBooked() async {
    getLockerId();
    getEmail();
    var response = await http.put(
      Uri.https('smart-locker-api.azurewebsites.net',
          'api/Locker/finish/${lockerId}'),
      headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "email": email,
        "lockerId": lockerId.toString(),
      },
    );
    print('----------');
    print(response.statusCode);
    if (response.statusCode == 200) {
      var parsedData = jsonDecode(response.body);
      // print('200 ja');
      // print('test');
      print(parsedData);
      price = double.parse('${parsedData}');
      // print('price');
      print(price);
      return price;
    } else if (response.statusCode == 400) {
      print('400');
    } else if (response.statusCode == 500) {
      print('500');
    } else
      return null;
  }

  Future getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      userName = preferences.getString('userName');
    });
  }

  Future getLockerId() async {
    SharedPreferences lockerPreferences = await SharedPreferences.getInstance();
    setState(() {
      lockerId = int.parse(lockerPreferences.getString('lockerId'));
    });
  }

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email');
    });
  }

  void initState() {
    super.initState();
    getUserName();
    getEmail();
    getLockerId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: SingleChildScrollView(
                          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/door-keys.png',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  DefaultButton(
                    text: "Open",
                    press: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                    text: "Close",
                    press: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultButton(
                    text: "Stop",
                    press: () async {
                      await stopBooked();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreditScreen(price)));
                    },
                  ),
                ],
              ),
            )));
  }
}
