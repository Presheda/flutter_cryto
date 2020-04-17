import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';

void main() async {
  List currencies  = await getCurrency();
  print(currencies);
  runApp(MyApp(currencies));

}

class MyApp extends StatelessWidget {

  final List _currencies;

  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme : new ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : null
      ),
      debugShowCheckedModeBanner: false,

      home: HomePage(_currencies),
    );
  }
}

Future<List> getCurrency() async {

  String cryptoUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=6d9afb33-0a8d-4378-9570-93b293fb0cf5";

  var response = await http.get(cryptoUrl);

  return jsonDecode(response.body)["data"];

}

