import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/screens/booked/components/body.dart';
import 'package:locker/screens/booked_detail/dialog.dart';
import 'package:locker/screens/payment/card/cardModel.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreditCard extends StatefulWidget {
  @override
  _CreditCardState createState() => _CreditCardState();
}

Future<CardModel> addCard(
  String cardNumber,
  String name,
  int month,
  int year,
  String cvc,
) async {
  var response = await http.post(
      Uri.https('smart-locker-api.azurewebsites.net', '/api/Charge/pay'),
      headers: {
        "accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode({
        'name': name,
        'cardNumber': cardNumber,
        'month': month,
        'year': year,
        'cvc': cvc,
        'value': 32000
      }));
  var data = response.body;
  print(data);
  if (response.statusCode == 201) {
    String responseString = response.body;
    cardModelFromJson(responseString);
  } else
    return null;
}

//int var =int.parse(_section_id.text);
class _CreditCardState extends State<CreditCard> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String cardNumber;
  int month;
  int year;
  String cvc;

  CardModel _cardModel;
  // String value;
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  // TextEditingController valueController = TextEditingController();
  final List<String> errors = [];
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            buildNameFormField(),
            SizedBox(height: 20),
            buildCardNumberFormField(),
            SizedBox(height: 20),
            Row(children: [
              Container(width: 170, child: buildMonthFormField()),
              SizedBox(width: 10),
              Container(width: 170, child: buildYearFormField())
            ]),
            SizedBox(height: 20),
            buildCVCFormField(),
            SizedBox(height: 20),
            FormError(errors: errors),
            DefaultButton(
              text: "Confirm",
              press: () async {
                if (_formKey.currentState.validate()) {
                  name = nameController.text;
                  cardNumber = cardNumberController.text;
                  month = int.parse(monthController.text);
                  year = int.parse(yearController.text);
                  cvc = cvcController.text;
                  print(name);
                  print(cardNumber);
                  print(month);
                  print(year);
                  print(cvc);

                  CardModel data =
                      await addCard(cardNumber, name, month, year, cvc);
                  setState(() {
                    _cardModel = data;
                  });

                  await Dialogs.yesDialog(context, "Payment", "Done");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailScreen()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: nameController,
      cursorColor: Color(0xFF6F35A5),
      onSaved: (newValue) => name = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your name");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your name");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Card Holder's Name",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildCardNumberFormField() {
    return TextFormField(
      // inputFormatters: [
      //   MaskTextInputFormatter(mask: "####-####-####-####"),
      // ],
      keyboardType: TextInputType.number,
      controller: cardNumberController,
      cursorColor: Color(0xFF6F35A5),
      onSaved: (newValue) => cardNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your card number");
        } else if (value.length == 16) {
          removeError(error: "Please Enter valid card number");
        }
        // cardNumber = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your card number");
          return "";
        } else if (value.length < 16) {
          addError(error: "Please Enter valid card number");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Card number",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildMonthFormField() {
    return TextFormField(
      // inputFormatters: [
      //   MaskTextInputFormatter(mask: "##"),
      // ],
      controller: monthController,
      keyboardType: TextInputType.number,
      cursorColor: Color(0xFF6F35A5),
      //   onSaved: (newValue) => month = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter month");
        } else if (value.length == 2 || int.parse(value) <= 12) {
          removeError(error: "Please Enter valid month");
        }
        // month = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter month");
          return "";
        } else if (value.length < 2 || int.parse(value) > 12) {
          addError(error: "Please Enter valid month");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "MM",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildYearFormField() {
    return TextFormField(
      // inputFormatters: [
      //   MaskTextInputFormatter(mask: "####"),
      // ],
      controller: yearController,
      keyboardType: TextInputType.number,
      cursorColor: Color(0xFF6F35A5),
      // onSaved: (newValue) => year = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter year");
        } else if (value.length == 4 || int.parse(value) <= 2021) {
          removeError(error: "Please Enter valid year");
        }
        // year = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter year");
          return "";
        } else if (value.length < 4 || int.parse(value) < 2021) {
          addError(error: "Please Enter valid year");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "YYYY",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildCVCFormField() {
    return TextFormField(
      // inputFormatters: [
      //   MaskTextInputFormatter(mask: "###"),
      // ],
      controller: cvcController,
      keyboardType: TextInputType.number,
      cursorColor: Color(0xFF6F35A5),
      onSaved: (newValue) => cvc = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter cvc");
        } else if (value.length == 3) {
          removeError(error: "Please Enter valid cvc");
        }
        // cvc = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter cvc");
          return "";
        } else if (value.length < 3) {
          addError(error: "Please Enter valid cvc");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "CVC",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
