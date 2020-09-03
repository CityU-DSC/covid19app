import 'package:covid19app/constant.dart';
import 'package:covid19app/screens/worldList/components/CountryData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderWithSelectRegion extends StatefulWidget {
  const HeaderWithSelectRegion({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _HeaderWithSelectRegionState createState() => _HeaderWithSelectRegionState();
}

class _HeaderWithSelectRegionState extends State<HeaderWithSelectRegion> {
  int total_infected;
  int total_deaths;
  String currentSelected = 'Taiwan';
  Map<String, CountryData> locations = {
    'United States': CountryData(location: 'The US', loc_url: 'united-states'),
    'Taiwan': CountryData(location: 'Taiwan', loc_url: 'taiwan'),
    'Mainland China': CountryData(location: 'China', loc_url: 'china'),
  };

  @override
  Widget build(BuildContext context) {
    CountryData.loadAll().then((temp) {
      locations.forEach((key, value) {
        value.getData();
      });
      setState(() => {});
    });

    return Container(
      margin: EdgeInsets.only(
        bottom: kDeffaultPdding * 2.5,
      ),
      height: widget.size.height * 0.23,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDeffaultPdding / 2,
              top: kDeffaultPdding / 2,
              right: kDeffaultPdding,
              bottom: kDeffaultPdding,
            ),
            height: widget.size.height * 0.2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryColor,
                  kSecondaryColor,
                ],
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/virus.png'),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Row(
              children: <Widget>[
                Positioned(
                  child: SvgPicture.asset(
                    'assets/icons/coronadr.svg',
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Text(
                  'Covid 19 \n Application',
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              height: 122,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                      SizedBox(width: 20),
                      Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: SizedBox(),
                          icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                          value: currentSelected,
                          items: locations.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              currentSelected = value;
                              total_infected = locations[value].total_cases;
                              total_deaths = locations[value].total_deaths;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text('Infected: $total_infected'),
                  ),
                  Container(
                    child: Text('Death: $total_deaths'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
