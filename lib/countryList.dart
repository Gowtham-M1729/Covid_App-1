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
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Countries'),
        centerTitle: true,
      ),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ((countries.length > 0)
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    constraints:
                        BoxConstraints(maxHeight: 820, maxWidth: 370.0),
                    padding: EdgeInsets.all(8.0),
                    color: Colors.purple,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            title: Text(countries[index]),
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
    );
  }
}
