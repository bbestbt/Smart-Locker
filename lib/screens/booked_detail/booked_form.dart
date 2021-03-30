import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/screens/payment/payment.dart';
import 'package:locker/screens/payment/scan.dart';

class BookedForm extends StatefulWidget {
  @override
  _BookedFormState createState() => _BookedFormState();
}

class _BookedFormState extends State<BookedForm> {
  DateTime _date = new DateTime.now();
  TimeOfDay _fromTime = new TimeOfDay.now();
  TimeOfDay _toTime = new TimeOfDay.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2022));
    if (picked != null && picked != _date) {
      print('Date selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> _selectFromTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _fromTime);

    if (picked != null && picked != _fromTime) {
      print('Time selected: ${_fromTime.toString()}');
      setState(() {
        _fromTime = picked;
      });
    }
  }

  Future<Null> _selectToTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _toTime);

    if (picked != null && picked != _toTime) {
      print('Time selected: ${_toTime.toString()}');
      setState(() {
        _toTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Row(
            children: [
              Text("Date : "),
              Spacer(flex: 2),
              RaisedButton(
                child: Text('Select Date'),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ],
          ),
          Text('Date selected: ${_date.toString()}'),
          Row(
            children: [
              Text('From : '),
              Spacer(flex: 2),
              RaisedButton(
                child: Text('Select Time'),
                onPressed: () {
                  _selectFromTime(context);
                },
              ),
            ],
          ),
          Text('From Time selected: ${_fromTime.toString()}'),
          Row(
            children: [
              Text('To : '),
              Spacer(flex: 2),
              RaisedButton(
                child: Text('Select Time'),
                onPressed: () {
                  _selectToTime(context);
                },
              ),
            ],
          ),
          Text('To Time selected: ${_toTime.toString()}'),
          DefaultButton(
            text: "Confirm",
            press: () {
              // Navigator.pushNamed(context, PaymentScreen.routeName);
              Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ScanPage()));
            },
          ),
        ],
      ),
    );
  }
}
