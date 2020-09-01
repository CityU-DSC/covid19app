import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/CountryData.dart';
import 'package:flutter_svg/svg.dart';
import 'package:covid19app/constant.dart';

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

  bool receivedAll() {
    for(int i=0; i<locations.length; i++) {
      if (locations[i].total_cases == 'loading...') {
        return false;
      }
      return true;
    }
  }

  void printCountryData(index) async{
    CountryData instance = locations[index];
    print(instance.location);
    await instance.getData();
    print(instance.total_cases);
    print(instance.total_deaths);
    print(instance.total_active);
    print(instance.total_recovery);
  }

  void loadCountryData(index) async {
    CountryData instance = locations[index];
    await instance.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('build start');

    // SORT LIST
    locations.sort((a,b) => a.location.compareTo(b.location));

    // LOAD ALL DATA (IF HAVEN'T ALREADY)
    if (!receivedAll()) {
      for(int i=0; i<locations.length; i++) {
        loadCountryData(i);
      }
      //loadCountryDataAll();
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar:AppBar(
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/dsc_icon.svg',
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Choose A Location',
          style: TextStyle(
            color: kBodyTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w100,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/menu.svg'),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context, index){
          return Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            color: Colors.white,
            child: ExpandablePanel(
              header: Text(
                locations[index].location,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
              collapsed: Text('Total Confirmed Cases: ' + locations[index].total_cases.toString()),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Confirmed Cases: ' + locations[index].total_cases),
                  Text('Total Deaths: ' + locations[index].total_deaths),
                  Text('Total Recoveries: ' + locations[index].total_recovery),
                  Text('Total Active Cases: ' + locations[index].total_active),
                ],

              ),
            ),
          );
        }
      ),
    );
  }
}