import 'package:covid_19_dashboard/panels/LocalPanel.dart';
import 'package:covid_19_dashboard/panels/WorldPanel.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StatPage extends StatefulWidget {
  @override
  _StatPageState createState() => _StatPageState();
}

class _StatPageState extends State<StatPage> {
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
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFF8d12fe),
            //centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                "STATISTICS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),

            bottom: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: Container(
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "LOCAL",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "GLOBAL",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                child: data == null
                    ? Center(child: CircularProgressIndicator())
                    : LocalPanel(
                        data: data,
                      ),
              ),
              Container(
                child: data == null
                    ? Center(child: CircularProgressIndicator())
                    : WorldPanel(
                        data: data,
                      ),
              ),
            ],
          )),
    );
  }
}
