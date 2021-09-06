import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserDetails(),
          ReportWidget(),
          CovidResources(),
          MostCases(),
          SearchWidget(),
        ],
      ),
    );
  }
}

class MostCases extends StatelessWidget {
  const MostCases({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 12.0),
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
              margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              height: 305.0,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color(0xffaf81dc),
                    ),
                    child: CountryTile(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color(0xffaf81dc),
                    ),
                    child: CountryTile(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color(0xffaf81dc),
                    ),
                    child: CountryTile(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color(0xffaf81dc),
                    ),
                    child: CountryTile(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: const Color(0xffaf81dc),
                    ),
                    child: CountryTile(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
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
  const CountryTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Country 1',
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
    );
  }
}

class CovidResources extends StatelessWidget {
  const CovidResources({
    Key? key,
  }) : super(key: key);

  _launchURLBrowser() async {
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
      onTap: () {
        const snackBar = SnackBar(content: Text('Tap'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        _launchURLBrowser();
      },
      child: Container(
        width: 350.0,
        padding: EdgeInsets.fromLTRB(70.0, 25.0, 70.0, 25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.0),
          color: const Color(0xff8f7ae2),
        ),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
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
              color: const Color(0xfffff2f2),
            ),
            textAlign: TextAlign.left,
          ),
        ],
      )
    ]);
  }
}

class ReportWidget extends StatelessWidget {
  const ReportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: const Color(0xff462456),
        ),
        child: Column(
          children: [
            Text(
              'GLOBAL CASES',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 30.0,
            ),
            DetailsWidget(),
            SizedBox(
              height: 10.0,
            ),
            DetailsWidget(),
            SizedBox(
              height: 10.0,
            ),
            DetailsWidget(),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Active Cases',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: const Color(0xffffffff),
          ),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          width: 110.0,
        ),
        Text(
          '123123',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 20,
            color: const Color(0xffffffff),
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
