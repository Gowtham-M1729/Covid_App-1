import 'package:flutter/material.dart';
import 'country.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  bool loading = true;
  List<String> countries = [];

  void getCountries() async {
    var url = Uri.https('projectify-covidapp.herokuapp.com', '/countryList');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var c in data) {
        countries.add(c);
      }
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCountries();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff66466E),
        body: (loading)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ((countries.length > 0)
                ? Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                        color: Color.fromRGBO(64, 22, 75, 1),
                      ),
                      padding: EdgeInsets.all(20.0),
                      //color: Colors.purple,
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 15);
                        },
                        itemBuilder: (context, index) {
                          return // Figma Flutter Generator Rectangle4Widget - RECTANGLE
                              Container(
                            width: 348,
                            height: 62,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Color.fromRGBO(102, 70, 110, 1),
                            ),
                            child: ListTile(
                              title: Text(
                                countries[index],
                                style: TextStyle(color: Colors.white38),
                              ),
                              tileColor: Colors.blue[100],
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          );
                        },
                        itemCount: countries.length,
                      ),
                    ),
                  )
                : Center(
                    child: Text('No countries to show!'),
                  )),
      ),
    );
  }
}
