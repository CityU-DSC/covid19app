import 'package:covid19app/components/app_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant.dart';

class DrawerWithIcons extends StatelessWidget {
  const DrawerWithIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                  ),
                  image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage('assets/images/wear_mask.png'),
                      fit: BoxFit.contain),
                ),
                child: Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.only(right: kDeffaultPdding),
                  child: Text(
                    "Stay Home \n& \nStay \nSafe",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
                padding: EdgeInsets.only(
                  top: kDeffaultPdding * 2,
                  left: kDeffaultPdding / 2,
                ),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'Info',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppInfoScreen.id);
                    },
                  ),
                  ListTile(
                      leading: Icon(FontAwesomeIcons.addressBook),
                      title: Text(
                        'Introduction',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        // Navigator.pushNamed(context, InstructionsScreen.id);
                      }),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      // Navigator.pushNamed(context, SettingsScreen.id);
                    },
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
