import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag; //url to assets flag icon
  String url; //url to the world time api
  bool isDayTime; //day or night

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    try{
      //make request
      Response response=await get('http://worldtimeapi.org/api/timezone/$url');
      Map data=jsonDecode(response.body);
      //print(data);

      //get property
      String datetime=data['datetime'];
      String offset=data['utc_offset'].substring(1,3);
      //rint(datetime);
      //print(offset);

      //create DateTime
      DateTime now=DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset)));

      //set time property
      isDayTime=now.hour> 6 && now.hour<20 ? true : false;
      time=DateFormat.jm().format(now);
    }
    catch(e) {
      print('Caught error: $e');
      time='could not get time data';
    }



  }

}

WorldTime instance = WorldTime(location:'Berlin', flag:'germany.png', url:'Europe/Berlin');
