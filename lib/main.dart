import 'package:covid19app/constant.dart';
import 'package:covid19app/screens/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/screens/worldList/worldListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'covid19app',
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor.withOpacity(.5),
        fontFamily: 'Poppins',
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kPrimaryColor),
      ),
      routes: {
        //'/': (context) => HomePage(),
        //'/home':(context)=>Home(),
        '/location':(context) => WorldListPage(),
      },
      home: HomePage(),
    );
  }
} 
