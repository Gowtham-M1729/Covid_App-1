import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'countryList.dart';
import 'countrydetails.dart';

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

class MostCases extends StatelessWidget {
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
                  CountryTile(countryName: 'Country 1'),
                  CountryTile(countryName: 'Country 2'),
                  CountryTile(countryName: 'Country 3'),
                  CountryTile(countryName: 'Country 4'),
                  CountryTile(countryName: 'Country 5'),
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
      onTap: () {
        Navigator.of(context).push(countryCases());
      },
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
            // activeCases: '',
            // newConfirmedCases: '',
            // newDeaths: '',
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
            // activeCases: '',
            // newConfirmedCases: '',
            // newDeaths: '',
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

/*
showCountryPicker(
            context: context,
            onClosed: route,
            onSelect: (Country country) {
              countryName = country.name;
              print(countryName);
            },
            countryListTheme: CountryListThemeData(
              textStyle: TextStyle(color: Colors.white),
              backgroundColor: Color(0xff6A3785),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
          );
*/