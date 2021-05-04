import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/OTP/otp_screen.dart';
import 'package:locker/screens/sign_up/account.dart';
import 'package:locker/screens/sign_up/components/body.dart';
import 'package:locker/screens/sign_up/account_service.dart';
import 'package:get_it/get_it.dart';

class SignUpForm extends StatefulWidget {
  final String accountID;
  SignUpForm({this.accountID});
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  String email;
  String phoneNumber;
  String password;
  String confirm_password;
  final List<String> errors = [];
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  AccountService get accountService => GetIt.I<AccountService>();
  String errorMessage;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  // Future<Account> _futureAccount;

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
              buildUsernameFormField(),
              SizedBox(height: 20),
              buildEmailFormField(),
              SizedBox(height: 20),
              buildPhoneNumberFormField(),
              SizedBox(height: 20),
              buildPasswordFormField(),
              SizedBox(height: 20),
              buildConfirmPasswordFormField(),
              FormError(errors: errors),
              SizedBox(height: 20),
              DefaultButton(
                  text: "Register",
                  press: () async {
                    // if (_formKey.currentState.validate()) {
                    //go to profile page
                    // Navigator.pushNamed(context, OtpScreen.routeName);
                    // setState(() {
                    //   _futureAccount = createAccount(
                    //       _controllerUsername.text,
                    //       _controllerPassword.text,
                    //       _controllerEmail.text,
                    //       _controllerPhone.text);
                    // });
                    //
                    setState(() {
                      _isLoading = true;
                    });
                    final newAccount = Account(
                        userName: _controllerUsername.text,
                        password: _controllerPassword.text,
                        phoneNumber: _controllerPhone.text,
                        email: _controllerEmail.text);
                    final result =
                        await accountService.createAccount(newAccount);
                    setState(() {
                      _isLoading = false;
                    });
                    final title = "Done";
                    final text = result.error
                        ? (result.errorMessage ?? 'error occur')
                        : 'account created';
                    // print(result.errorMessage);
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              title: Text(title),
                              content: Text(text),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("ok"))
                              ],
                            )).then((data) {
                      if (result.data) {
                        Navigator.of(context).pop();
                      }
                    });
                  }
                  //},
                  ),
              // FutureBuilder<Account>(
              //   future: _futureAccount,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Text(snapshot.data.username);
              //     } else if (snapshot.hasError) {
              //       return Text("${snapshot.error}");
              //     }

              //     return CircularProgressIndicator();
              //   },
              // )
              //
            ],
          ),
        ));
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: _controllerUsername,
      cursorColor: Color(0xFF6F35A5),
      //keyboardType: TextInputType.name,
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your username");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your username");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          // labelText: "username",
          hintText: "Username",
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      // controller: _controllerPassword,
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: "Password doesn't match");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: "Password doesn't match");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        // labelText: "Confirm password",
        hintText: "Confirm password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _controllerPassword,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.length >= 6) {
          removeError(error: "Password is too short");
        } else if (RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
          removeError(error: "Please Enter Valid Password");
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if (value.length < 6) {
          addError(error: "Password is too short");
          return "";
        } else if (!(RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))
            .hasMatch(value)) {
          addError(error: "Please Enter Valid Password");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Password",
        hintText: "Password",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your email");
        } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          removeError(error: "Please Enter Valid Email");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your email");
          return "";
        } else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
            .hasMatch(value)) {
          addError(error: "Please Enter Valid Email");
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        // labelText: "Email",
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _controllerPhone,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your phone number");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your phone number");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        // labelText: "Phone Number",
        hintText: "Phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }
}
