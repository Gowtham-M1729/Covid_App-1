import 'widgets.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserDetails(),
              ReportWidget(),
              CovidResources(),
              MostCases(),
              // SearchWidget(),
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
