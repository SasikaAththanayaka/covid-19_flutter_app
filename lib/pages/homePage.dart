import 'dart:convert';

import 'package:covid_19_dashboard/panels/LocalPanel.dart';
import 'package:covid_19_dashboard/panels/WorldPanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data;
  getData() async {
    http.Response response = await http.get(
        Uri.parse('https://www.hpb.health.gov.lk/api/get-current-statistical'));
    setState(() {
      data = json.decode(response.body);
      //print(data["data"]);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF8d12fe),
        centerTitle: false,
        title: Text("Covid-19 Tracker"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0XFF8d12fe),
            Color(0XFF8d12fe).withOpacity(.1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10.0),
                color: Colors.deepPurple,
                child: Text(
                  "\"Nothing in life is to be feared, it is only to be\n understood. Now is the time to understand more,\nSo that we may fear less.\"",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              Container(
                //color: Colors.deepPurpleAccent,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Text(
                    "GLOBAL",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  color: Colors.deepPurple,
                  width: MediaQuery.of(context).size.width,
                  child: data == null
                      ? CircularProgressIndicator()
                      : WorldPanel(data: data)),
              Container(
                //color: Colors.deepPurpleAccent,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: Text(
                    "LOCAL",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                  color: Colors.deepPurple,
                  width: MediaQuery.of(context).size.width,
                  child: data == null
                      ? CircularProgressIndicator()
                      : LocalPanel(
                          data: data,
                        )),
              Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                height: 60.0,
                padding: EdgeInsets.only(left: 80.0, right: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "ALL COUNTRIES",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
