import 'package:flutter/material.dart';

class ReportWidget extends StatelessWidget {
  final String text;
  final String totalConfirmedCases;
  final String totalDeathCases;
  final String totalRecovered;
  ReportWidget({
    required this.text,
    required this.totalConfirmedCases,
    required this.totalDeathCases,
    required this.totalRecovered,
  });

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
              '$text',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 27,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20.0),
            DetailsWidget(text: 'Confirmed',data: totalConfirmedCases),
            DetailsWidget(text: 'Deaths', data: totalDeathCases),
            DetailsWidget(text: 'Recovered', data: totalRecovered),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  final String text;
  final String data;
  DetailsWidget({
    required this.text,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text(
              '$text',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Text(
              '$data',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 20,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
