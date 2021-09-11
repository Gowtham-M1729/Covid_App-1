import 'package:flutter/material.dart';
import 'widgets.dart';

class CountryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Country',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 27,
              color: const Color(0xff2a3137),
            ),
            textAlign: TextAlign.left,
          ),
          Container(
            child: Image.asset(
              'assets/image1.png',
              height: 180.0,
              width: 250.0,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              CasesOverview(),
              SizedBox(
                width: 20.0,
              ),
              CasesOverview(),
              SizedBox(
                width: 20.0,
              ),
              CasesOverview(),
            ],
          ),
          ReportWidget(),
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
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
              SizedBox(
                width: 10.0,
              ),
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
          SizedBox(
            width: 10.0,
          )
        ],
      ),
    );
  }
}

class CasesOverview extends StatelessWidget {
  const CasesOverview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19.0),
        color: const Color(0x877f5899),
      ),
      child: Text(
        'active',
        style: TextStyle(
          fontFamily: 'Segoe UI',
          fontSize: 19,
          color: const Color(0xff000000),
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
