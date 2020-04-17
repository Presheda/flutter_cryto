
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{

  final List currencies;

  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  List currencies;

   List<MaterialColor> _colors = [
    Colors.blue,
    Colors.indigo,
    Colors.red,

  ];




//  Future<List> getCurrency() async {
//
//    String cryptoUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?CMC_PRO_API_KEY=6d9afb33-0a8d-4378-9570-93b293fb0cf5";
//
//    var response = await http.get(cryptoUrl);
//
//    return jsonDecode(response.body)["data"];
//
//  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0 : 5.0,
      ),

      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget(){


    return new Container(
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
                itemCount: widget.currencies == null ? 0 : widget.currencies.length,
                itemBuilder: (BuildContext context, int index){
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];
                return _getListItemUi(currency, color);
                }
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color){



    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(currency["name"][0],
        style: TextStyle(color: Colors.white),
        ),
      ),
      title: Text(currency["name"],
      style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(
          currency["quote"]["USD"]["price"], currency["quote"]["USD"]["percent_change_1h"]),
      isThreeLine: true,
    );


  }

  Widget _getSubtitleText(double priceUSD, double percentageChange){


    TextSpan priceTextWidget = TextSpan(text: "\$$priceUSD\n",
    style: TextStyle(color: Colors.black));

    String percentageChangeText ="1 hour: $percentageChange%";

    TextSpan percentageChangeTextWidget;


    if(percentageChange > 0){
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(color:  Colors.green)
      );
    } else{
      percentageChangeTextWidget = TextSpan(
          text: percentageChangeText,
          style: TextStyle(color:  Colors.red)
      );
    }

    return RichText(
        text: TextSpan(
          children: [priceTextWidget, percentageChangeTextWidget]
        )
    );

  }
}

