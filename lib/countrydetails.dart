import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'globalcases.dart';

class CountryDetails extends StatefulWidget {
  final String countryName;
  // final String activeCases;
  // final String newConfirmedCases;
  // final String newDeaths;

  CountryDetails({
    required this.countryName,
    // required this.activeCases,
    // required this.newConfirmedCases,
    // required this.newDeaths,
  });

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  bool loading = true;
  String countryName = "";
  String activeCases = "NA";
  String newConfirmedCases = "NA";
  String newDeaths = "NA";
  String totalConfirmedCases = "NA";
  String totalDeathCases = "NA";
  String totalRecovered = "NA";

  void getCases() async {
    String url = "https://projectify-covidapp.herokuapp.com/country/" +
        widget.countryName;
    print(url);
    var response = await http.get(Uri.parse(url));

    Map data = {};
    data = json.decode(response.body);
    setState(() {
      //NumberFormat.decimalPattern().format(data['totalConfirmed'] - data['totalDeaths'])
      countryName = widget.countryName;
      activeCases =
          NumberFormat.decimalPattern().format(data['active']).toString();
      newConfirmedCases =
          NumberFormat.decimalPattern().format(data['newConfirmed']).toString();
      newDeaths =
          NumberFormat.decimalPattern().format(data['newDeaths']).toString();
      totalConfirmedCases = NumberFormat.decimalPattern()
          .format(data['totalConfirmed'])
          .toString();
      totalDeathCases =
          NumberFormat.decimalPattern().format(data['totalDeaths']).toString();
      totalRecovered = NumberFormat.decimalPattern()
          .format(data['totalConfirmed'] - data['totalDeaths'])
          .toString();
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC8AED1),
      appBar: AppBar(
        backgroundColor: Color(0xffaf81dc),
        centerTitle: true,
        title: Text(
          '$countryName',
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: 27,
            color: const Color(0xff2a3137),
          ),
          textAlign: TextAlign.left,
        ),
      ),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/image1.png',
                        height: 180.0,
                        width: 250.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CasesOverview(text: "Active", data: "$activeCases"),
                        SizedBox(width: 15.0),
                        CasesOverview(
                            text: "Confirmed", data: "$newConfirmedCases"),
                        SizedBox(width: 15.0),
                        CasesOverview(text: "Deaths", data: "$newDeaths"),
                      ],
                    ),
                    ReportWidget(
                      text: 'TOTAL CASES',
                      totalConfirmedCases: '$totalConfirmedCases',
                      totalDeathCases: '$totalDeathCases',
                      totalRecovered: '$totalRecovered',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: const Color(0xff8f7ae2),
                          ),
                          child: Text(
                            'Call Helpline',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 27,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.0),
                            color: const Color(0xff8f7ae2),
                          ),
                          child: Text(
                            'Call Helpline',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 27,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CasesOverview extends StatelessWidget {
  final String text;
  final String data;

  CasesOverview({
    required this.text,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(22.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        color: const Color(0x877f5899),
      ),
      child: Column(
        children: [
          Text(
            '$text',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 19,
              color: const Color(0xff000000),
            ),
          ),
          Text(
            '$data',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 19,
              color: const Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }
}
