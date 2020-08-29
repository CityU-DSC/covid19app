import 'package:flutter/material.dart';

import '../../../constant.dart';

class CurrentFigureCard extends StatelessWidget {
  const CurrentFigureCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FigureCard(
            image: 'assets/images/headache.png',
            title: "Infected",
            unit: 'Million',
            amount: 10.8,
          ),
          FigureCard(
            image: 'assets/images/fever.png',
            title: "Death",
            amount: 2.1,
            unit: 'Million',
          ),
          FigureCard(
            image: 'assets/images/caugh.png',
            title: "Recovered",
            amount: 8.3,
            unit: 'Million',
          ),
        ],
      ),
    );
  }
}

class FigureCard extends StatelessWidget {
  const FigureCard({
    Key key,
    this.image,
    this.title,
    this.amount,
    this.unit,
    this.size,
  }) : super(key: key);

  final String image, title;
  final double amount;
  final String unit;

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDeffaultPdding,
        top: kDeffaultPdding * 1.5,
        bottom: kDeffaultPdding * 2.5,
      ),
      width: size.width * 0.45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: kSecondaryColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: size.width * 0.5,
            padding: EdgeInsets.all(kDeffaultPdding / 2),
            margin: EdgeInsets.only(bottom: kDeffaultPdding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: kBodyTextColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: kSecondaryColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(kDeffaultPdding / 3),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$title".toUpperCase(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    image,
                    height: 40,
                    width: size.width * 0.1,
                    fit: BoxFit.fill,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: kDeffaultPdding / 2),
            child: Column(
              children: <Widget>[
                Text(
                  '$amount',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$unit',
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.4),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
