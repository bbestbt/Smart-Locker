import 'package:flutter/material.dart';
import 'package:locker/screens/booked_detail/body.dart';

class BookDetailScreen extends StatelessWidget {
  static String routeName="/book_detail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:Body(),
      
    );
  }
}
