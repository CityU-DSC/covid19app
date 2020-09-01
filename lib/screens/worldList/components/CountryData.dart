import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

// import 'dart:async';

class CountryData {
  String location;
  String loc_url; //url to the world time api
  DateTime
      date; // https://api.dart.dev/stable/2.9.2/dart-core/DateTime/toIso8601String.html
  String
      from_date; // https://api.dart.dev/stable/2.9.2/dart-core/DateTime/toIso8601String.html
  String
      to_date; // https://api.dart.dev/stable/2.9.2/dart-core/DateTime/toIso8601String.html
  int total_cases = null;
  int total_deaths = null;
  int total_recovery = null;
  int total_active = null;
  int tries = 0;

  static List<dynamic> allData = null;
  static DateTime previousCalledDate = null;

  static Future<void> loadAll() async {
    if (CountryData.isAllDataFetched()) {
      return;
    }
    try {
      String full_url = 'https://api.covid19api.com/summary';
      Response response = await get(full_url);
      allData = jsonDecode(response.body)['Countries'];
      previousCalledDate = new DateTime.now();
    } catch (e) {
      print('Caught error: $e');
    }
  }

  CountryData({this.location, this.loc_url});

  Future<void> getData() async {
    tries++;

    if (!CountryData.isAllDataFetched()) {
      return;
    }

    bool countryMatch(_countryData) {
      if ([
        _countryData['CountryCode'],
        _countryData['Slug'],
        _countryData['Country']
      ].contains(this.loc_url)) {
        return true;
      }
      return false;
    }

    dynamic countryData;
    try {
      countryData = allData.singleWhere(countryMatch);
    } catch (e) {
      throw 'Country Data ' + this.loc_url + ' missing.';
    }

    date = new DateTime.now();

    from_date = date.add(new Duration(days: -1)).toIso8601String();
    to_date = date.toIso8601String();

    from_date = from_date.substring(0, 11) + '00:00:00Z';
    to_date = to_date.substring(0, 11) + '00:00:00Z';

    try {
      // //make request
      // //'https://api.covid19api.com/total/country/($url)?from=2020-08-28T00:00:00Z&to=2020-08-28T23:00:00Z';
      // String full_url =
      //     'https://api.covid19api.com/total/country/$loc_url?from=$from_date&to=$to_date';
      // Response response = await get(full_url);
      // print('FULL URL: $full_url');
      // Map data =
      //     jsonDecode(response.body.substring(1, response.body.length - 2));

      total_cases = countryData['TotalConfirmed'];
      total_deaths = countryData['TotalDeaths'];
      total_recovery = countryData['TotalRecovered'];
      total_active = total_cases - total_deaths - total_recovery;
    } catch (e) {
      print('Caught error: $e');

      if (tries <= 10) {
        await new Future.delayed(
            Duration(seconds: tries), () => this.getData());
      }
    }
  }

  static bool isAllDataFetched() {
    return allData != null && previousCalledDate.day == new DateTime.now().day;
  }
}

//CountryData instance = CountryData(location: 'The US', url: 'usa');

// void main() async {
//   CountryData.loadAll();
//   print(CountryData.allData);

// /*  CountryData instance = CountryData(location: 'The US', loc_url: 'usa');
//   print(instance.location);
//   await instance.getData();
//   print(instance.total_cases);
//   print(instance.total_deaths);
//   print(instance.total_active);
//   print(instance.total_recovery);

//   print('${instance.from_date} - ${instance.to_date}');
//   */
// }
// dart CountryData.dart;
