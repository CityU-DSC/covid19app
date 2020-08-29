import 'package:covid19app/components/drawerToolBar.dart';
import 'package:covid19app/constant.dart';
import 'package:covid19app/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWithIcons(),
      appBar: buildAppBar(),
      body: Body(),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/dsc_icon.svg',
          color: Colors.white,
        ),
        onPressed: null,
      ),
      title: Text(
        'CityU DSC',
        style: TextStyle(
          color: kBodyTextColor,
          fontSize: 15,
          fontWeight: FontWeight.w100,
        ),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset('assets/icons/menu.svg'),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        )
      ],
    );
  }
}
