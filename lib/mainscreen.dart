import 'widgets.dart';
import 'package:flutter/material.dart';

import 'globalcases.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
                totalConfirmedCases: '',
                totalDeathCases: '',
                totalRecovered: '',
              ),
              CovidResources(),
              MostCases(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SearchWidget(),
      ),
    );
  }
}
