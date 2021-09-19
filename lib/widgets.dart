import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'countryList.dart';
import 'countrydetails.dart';
import 'package:http/http.dart' as http;

class UserDetails extends StatelessWidget {
  const UserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textBaseline: TextBaseline.alphabetic,
      children: [
        Icon(Icons.person, size: 35.0),
        SizedBox(
          width: 5.0,
        ),
        Text(
          'Hello James,',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 27,
            color: const Color(0xff000000),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}

class CovidResources extends StatelessWidget {
  const CovidResources({
    Key? key,
  }) : super(key: key);

  _launchURL() async {
    const url = 'https://www.covidresourcesindia.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        // width: 350.0,
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.0),
          color: const Color(0xff8f7ae2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'COVID RESOURCES',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xfffff0f0),
              ),
              textAlign: TextAlign.left,
            ),
            Icon(Icons.double_arrow_outlined, size: 30.0)
          ],
        ),
      ),
    );
  }
}

class MostCases extends StatefulWidget {
  @override
  State<MostCases> createState() => _MostCasesState();
}

class _MostCasesState extends State<MostCases> {
  List countries = [];
  String country1 = "NA";
  String country2 = "NA";
  String country3 = "NA";
  String country4 = "NA";
  String country5 = "NA";

  void getCountries() async {
    var url = Uri.https('projectify-covidapp.herokuapp.com', '/MostCases');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var c in data) {
        countries.add(c);
      }
    }
    country1 = countries[0];
    country2 = countries[1];
    country3 = countries[2];
    country4 = countries[3];
    country5 = countries[4];
  }

  void initState() {
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19.0),
          color: const Color(0xffdaceeb),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 5.0,
            ),
            Text(
              'MOST CASES',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xff020000),
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              height: 298.0,
              child: Column(
                children: [
                  CountryTile(countryName: country1),
                  CountryTile(countryName: country2),
                  CountryTile(countryName: country3),
                  CountryTile(countryName: country4),
                  CountryTile(countryName: country5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CountryTile extends StatelessWidget {
  final String countryName;

  CountryTile({required this.countryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (countryName == 'NA')
          ? null
          : () => Navigator.of(context).push(countryCases()),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: const Color(0xffaf81dc),
        ),
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$countryName',
                style: TextStyle(
                  fontFamily: 'Segoe UI',
                  fontSize: 20,
                  color: const Color(0xff020000),
                ),
                textAlign: TextAlign.left,
              ),
              Icon(Icons.arrow_forward_ios_outlined, size: 25.0)
            ],
          ),
        ),
      ),
    );
  }

  Route countryCases() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryanimation) {
        return Scaffold(
          body: CountryDetails(
            countryName: countryName,
          ),
        );
      },
    );
  }
}

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool tapped = false;
  String countryName = "";

  void route() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CountryDetails(
            countryName: countryName,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CountriesList();
              },
            ),
          );
        },
        child: Stack(alignment: AlignmentDirectional.center, children: [
          SvgPicture.string(
            '<svg viewBox="0.0 772.0 393.0 79.0" ><path transform="matrix(-1.0, 0.0, 0.0, -1.0, 405.0, 919.0)" d="M 11.99970054626465 101.9876480102539 L 11.99970054626465 68.00040435791016 L 405.0003051757812 68.00040435791016 L 405.0003051757812 101.9876327514648 C 378.3428039550781 128.0993041992188 300.44482421875 146.9996948242188 208.4999847412109 146.9996948242188 C 116.5551605224609 146.9996948242188 38.6572151184082 128.0993194580078 11.99970054626465 101.9876480102539 Z" fill="#6a3785" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
            allowDrawingOutsideViewBox: true,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
                size: 35,
              ),
              Text(
                'SEARCH',
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 26,
                    // color: const Color(0xfffff2f2),
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
