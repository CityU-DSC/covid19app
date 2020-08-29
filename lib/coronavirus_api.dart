import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String url = 'https://api.covid19api.com/country/south-africa?from=2020-08-28T00:00:00Z&to=2020-08-29T00:00:00Z';
          Response response = await get(url);
          Map data = jsonDecode(response.body.substring(1,response.body.length-2));
          //await print(response.body[0]);
          //print(response.body.substring(1,response.body.length-2));
          print(data);
        },
      ),
    ),
  ));
}

