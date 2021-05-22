import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/screens/booked_detail/dialog.dart';
import 'package:locker/screens/payment/card/credit.dart';
import 'package:locker/screens/payment/payment.dart';
import 'package:locker/screens/payment/scan/scan.dart';
import 'package:locker/screens/booked_detail/lockerModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookedForm extends StatefulWidget {
  @override
  _BookedFormState createState() => _BookedFormState();
}

class _BookedFormState extends State<BookedForm> {
  String userName = '';
  int lockerId;
  String email = '';
  lockerModel _lockerModel;

  Future stopBooked() async {
    getLockerId();
    getEmail();
    var response = await http.put(
      Uri.https(
          'smart-locker-api.azurewebsites.net', 'api/Locker/finish/${lockerId}'),
      headers: {
        "accept": "application/json",
        "content-type": "application/json",
        "email": email,
        "lockerId": lockerId.toString(),
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
     print('200');
    // print(lockerId);
    } else if(response.statusCode == 400){
       print('400');
    }
    else if(response.statusCode == 500){
       print('500');
    }
    else
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

  Future<lockerModel> bookLocker(int lockerId, String date, String time) async {
    getLockerId();
    getEmail();
    var response = await http.put(
        Uri.https('smart-locker-api.azurewebsites.net', 'api/Locker/book'),
        headers: {
          "accept": "application/json",
          "content-type": "application/json",
          "email": email,
        },
        body: jsonEncode({
          "lockerId": lockerId,
          "date": date,
          'time': time,
        }));
    // print(email);
    print(response.statusCode);
    var data = response.body;
    print(data);
    if (response.statusCode == 204) {
      String responseString = response.body;
      lockerModelFromJson(responseString);
    }else if(response.statusCode==500){
      print('500 ja');
    }
     else
      return null;
  }

  void initState() {
    super.initState();
    getUserName();
    getEmail();
    getLockerId();
  }

  DateTime date = new DateTime.now();
  TimeOfDay time = new TimeOfDay.now();
  // TimeOfDay _toTime = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2022));
    if (picked != null && picked != date) {
      print('Date selected: ${date.toString()}');
      setState(() {
        date = picked;
      });
    }
  }

  Future<Null> _selectFromTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: time);

    if (picked != null && picked != time) {
      print('Time selected: ${time.toString()}');
      setState(() {
        time = picked;
      });
    }
  }

  // Future<Null> _selectToTime(BuildContext context) async {
  //   final TimeOfDay picked =
  //       await showTimePicker(context: context, initialTime: _toTime);

  //   if (picked != null && picked != _toTime) {
  //     print('Time selected: ${_toTime.toString()}');
  //     setState(() {
  //       _toTime = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Date : ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Spacer(flex: 2),
              RaisedButton(
                child: Text('Select Date'),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('Date selected: ${date.toString()}'),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'From : ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
              ),
              Spacer(flex: 2),
              RaisedButton(
                child: Text('Select Time'),
                onPressed: () {
                  _selectFromTime(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text('From Time selected: ${time.toString()}'),
          SizedBox(
            height: 20,
          ),

          Text(lockerId.toString()),
          //  Text(email),

          // Row(
          //   children: [
          //     Text('To : ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.black),),
          //     Spacer(flex: 2),
          //     RaisedButton(
          //       child: Text('Select Time'),
          //       onPressed: () {
          //         _selectToTime(context);
          //       },
          //     ),
          //   ],
          // ),
          //  SizedBox(height: 10,),
          // Text('To Time selected: ${_toTime.toString()}'),
          // SizedBox(height: 20,),
          DefaultButton(
            text: "Confirm",
            press: () async {
              print(lockerId);
              print(date.toString());
               print(time.toString());
              lockerModel data =
                  await bookLocker(lockerId, date.toString(), time.toString());
              setState(() {
                _lockerModel = data;
              });
              Dialogs.yesDialog(context, "Booked Locker", "Done");
            },
          ),
          SizedBox(
            height: 20,
          ),
          DefaultButton(
            text: "Stop",
            press: () {
               stopBooked();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreditScreen()));
            },
          ),
          //      Center(child: userName==''? Text(''):Text(userName)),
        ],
      ),
    );
  }
}
