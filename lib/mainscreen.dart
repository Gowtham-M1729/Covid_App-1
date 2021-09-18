import 'widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'globalcases.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String totalConfirmedCases = 'NA';
  String totalDeathCases = 'NA';
  String totalRecovered = 'NA';

  void getGlobalCases() async{
    String url = "https://projectify-covidapp.herokuapp.com/Global";
    var response = await http.get(Uri.parse(url));
    
    Map data = {};
    data = json.decode(response.body);
    setState(() {
      totalConfirmedCases = data['totalConfirmed'].toString();
      totalDeathCases = data['totalDeaths'].toString();
      totalRecovered = (data['totalConfirmed']-data['totalDeaths']).toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getGlobalCases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC8AED1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserDetails(),
              ReportWidget(
                text: 'GLOBAL CASES',
                totalConfirmedCases: '$totalConfirmedCases',
                totalDeathCases: '$totalDeathCases',
                totalRecovered: '$totalRecovered',
              ),
              CovidResources(),
              MostCases(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFC8AED1),
        child: SearchWidget(),
      ),
    );
  }
}
