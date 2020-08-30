import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/CountryData.dart';

class WorldListPage extends StatefulWidget {
  @override
  _WorldListPageState createState() => _WorldListPageState();
}

class _WorldListPageState extends State<WorldListPage> {

  // https://api.covid19api.com/countries
  List<CountryData> locations = [
    CountryData(location: 'The US', loc_url: 'usa'),
    CountryData(location: 'Canada', loc_url: 'canada'),
    CountryData(location: 'Mexico', loc_url: 'mexico'),
    CountryData(location: 'Argentina', loc_url: 'argentina'),
    CountryData(location: 'Chile', loc_url: 'chile'),
    CountryData(location: 'Taiwan', loc_url: 'taiwan'),
    CountryData(location: 'China', loc_url: 'china'),
    CountryData(location: 'Japan', loc_url: 'japan'),
    CountryData(location: 'South Korea', loc_url: 'south-korea'),
    CountryData(location: 'South Africa', loc_url: 'south-africa'),
    CountryData(location: 'UK', loc_url: 'uk'),
    CountryData(location: 'Denmark', loc_url: 'denmark'),
    CountryData(location: 'Germany', loc_url: 'germany'),
    CountryData(location: 'France', loc_url: 'france'),
    CountryData(location: 'Portugal', loc_url: 'portugal'),
    CountryData(location: 'Spain', loc_url: 'spain'),
  ];

  void printCountryData(index) async{
    CountryData instance = locations[index];
    print(instance.location);
    await instance.getData();
    print(instance.total_cases);
    print(instance.total_deaths);
    print(instance.total_active);
    print(instance.total_recovery);
  }

/*
  void updateData(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDayTime,
    });

  }
  */

  @override
  Widget build(BuildContext context) {
    print('build start');

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context, index){
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap:(){
                  print(locations[index].location);
                  printCountryData(index);
                },
                title: Text(locations[index].location),
              ),
            ),
          );
        }
      ),
    );
  }
}
/*
List<CountryData> locations = [
    CountryData(location: 'The US', loc_url: 'usa'),
    CountryData(location: 'Canada', loc_url: 'canada'),
    CountryData(location: 'Mexico', loc_url: 'mexico'),
    CountryData(location: 'Argentina', loc_url: 'argentina'),
    CountryData(location: 'Chile', loc_url: 'chile'),
    CountryData(location: 'Taiwan', loc_url: 'taiwan'),
    CountryData(location: 'China', loc_url: 'china'),
    CountryData(location: 'Japan', loc_url: 'japan'),
    CountryData(location: 'South Korea', loc_url: 'south-korea'),
    CountryData(location: 'South Africa', loc_url: 'south-africa'),
    CountryData(location: 'UK', loc_url: 'uk'),
    CountryData(location: 'Denmark', loc_url: 'denmark'),
    CountryData(location: 'Germany', loc_url: 'germany'),
    CountryData(location: 'France', loc_url: 'france'),
    CountryData(location: 'Portugal', loc_url: 'portugal'),
    CountryData(location: 'Spain', loc_url: 'spain'),
  ];

  void printCountryData(index) async{
    CountryData instance = locations[index];
    print(instance.location);
    await instance.getData();
    print(instance.total_cases);
    print(instance.total_deaths);
    print(instance.total_active);
    print(instance.total_recovery);
  }

void main() async {
  printCountryData(0);
}
*/