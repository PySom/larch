import 'package:flutter/material.dart';
import 'parish_view.dart';
import 'home.dart';
import 'address.dart';
import 'donation.dart';

//Main is the entry to our app
void main() {
  runApp(
    //This is our root component
    MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        primaryColor: Color(0xFF013C8B),
      ),
      home: ParishViewPage(),
    ),
  );
}
