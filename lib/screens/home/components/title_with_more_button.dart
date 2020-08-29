import 'package:flutter/material.dart';

import '../../../constant.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key key,
    this.title,
    this.press,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDeffaultPdding),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderline(text: title, sub: subtitle),
          Spacer(),
          FlatButton(
            onPressed: press,
            child: Text(
              'More',
              style: TextStyle(color: Colors.white),
            ),
            color: kPrimaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          )
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key key,
    this.text,
    this.sub,
  }) : super(key: key);

  final String text;
  final String sub;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: kDeffaultPdding / 4),
                  child: Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: kDeffaultPdding,
                  child: Text(
                    sub,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
