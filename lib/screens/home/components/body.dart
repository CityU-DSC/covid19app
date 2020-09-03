import 'package:covid19app/screens/home/components/currentFigure.dart';
import 'package:covid19app/screens/home/components/header.dart';
import 'package:covid19app/screens/home/components/title_with_more_button.dart';
import 'package:covid19app/screens/home/components/worldInfectedMap.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSelectRegion(size: size),
          TitleWithMoreBtn(
            title: 'Selected Country',
            subtitle: 'This is the total figure',
            press: () {},
          ),
          CurrentFigureCard(),
          TitleWithMoreBtn(
            title: 'Current',
            subtitle: 'This is the total figure',
            press: () {},
          ),
          CurrentFigureCard(),
          TitleWithMoreBtn(
            title: 'World Map',
            subtitle: '',
            press: () async {
              /*dynamic result = await */ Navigator.pushNamed(
                  context, '/location');
              /*
              setState((){
                data={
                  'location':result['location'],
                  'flag':result['flag'],
                  'time':result['time'],
                  'isDaytime':result['isDaytime'],
                };
              });
              */
            },
          ),
          WorldInfectedMap(),
        ],
      ),
    );
  }
}
