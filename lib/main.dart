// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';

void main() {
  runApp(Demo());
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: "FLUTTURA", home: splash());
  }
} 
//---------------------------------------------------------------------
