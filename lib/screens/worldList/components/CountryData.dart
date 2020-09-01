import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'dart:async';

class CountryData {
  String location;
  String loc_url; //url to the world time api
  DateTime
      date; // https://api.dart.dev/stable/2.9.2/dart-core/DateTime/toIso8601String.html
  String
      from_date; // https://api.dart.dev/stable/2.9.2/dart-core/DateTime/toIso8601String.html
  String
      to_date; // https://api.dart.dev/stable/2.9.2/dart-core/DateTime/toIso8601String.html
  String total_cases;
  String total_deaths;
  String total_recovery;
  String total_active;
  int tries = 0;

  static dynamic allData = null;
  static DateTime previousCalledDate = null;

  static Future<void> loadAll() async {
    if (allData != null && previousCalledDate.day == (new DateTime.now().day)) {
      return;
    }
    try {
      String full_url =
          'https://api.covid19api.com/summary';
      Response response = await get(full_url);
      allData = jsonDecode(response.body.substring(1, response.body.length - 2));
      previousCalledDate = new DateTime.now();
    } catch (e) {
      print('Caught error: $e');
    }
  }


  CountryData({this.location, this.loc_url});

  Future<void> getData() async {
    tries++;
    date = new DateTime.now();

    from_date = date.add(new Duration(days: -1)).toIso8601String();
    to_date = date.toIso8601String();

    from_date = from_date.substring(0, 11) + '00:00:00Z';
    to_date = to_date.substring(0, 11) + '00:00:00Z';

    try {
      //make request
      //'https://api.covid19api.com/total/country/($url)?from=2020-08-28T00:00:00Z&to=2020-08-28T23:00:00Z';
      String full_url =
          'https://api.covid19api.com/total/country/$loc_url?from=$from_date&to=$to_date';
      Response response = await get(full_url);
      print('FULL URL: $full_url');
      Map data =
          jsonDecode(response.body.substring(1, response.body.length - 2));

      total_cases = data['Confirmed'];
      total_deaths = data['Deaths'];
      total_recovery = data['Recovered'];
      total_active = data['Active'];
    } catch (e) {
      print('Caught error: $e');

      if (tries <= 10){
        await new Future.delayed(Duration(seconds: tries), () => this.getData());
      }
    }
  }
}

//CountryData instance = CountryData(location: 'The US', url: 'usa');

void main() async {
  CountryData.loadAll();
  print(CountryData.allData);


/*  CountryData instance = CountryData(location: 'The US', loc_url: 'usa');
  print(instance.location);
  await instance.getData();
  print(instance.total_cases);
  print(instance.total_deaths);
  print(instance.total_active);
  print(instance.total_recovery);

  print('${instance.from_date} - ${instance.to_date}');
  */
}
// dart CountryData.dart;
