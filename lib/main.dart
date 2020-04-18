import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

void main() async {

  runApp(MyApp());

}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme : new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : null
      ),
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}

