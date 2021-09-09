import 'dart:ui';

import 'package:covid_19_dashboard/pages/StatPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height * .35,
            decoration: BoxDecoration(
                color: Colors.blue,
                //image: Image.asset("assets/virus2.png"),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                  //topLeft: Radius.circular(20.0),
                  //topRight: Radius.circular(20.0),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                  child: Text("COVID-19",
                      style: TextStyle(color: Colors.white, fontSize: 35.0)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20.0),
                  child: Text("Coronavirus Relief Fund",
                      style: TextStyle(
                          color: Colors.white, fontSize: 14.0, height: 1.5)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, bottom: 15.0, left: 20.0),
                  child: Text(
                      "to this fund will help to stop the virus's spred and give\ncommunication the font line",
                      style: TextStyle(
                          color: Colors.white, fontSize: 13.0, height: 1.5)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 25.0, left: 65.0),
                  child: Row(
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.blueAccent,
                        onPressed: () {},
                        child: Text("DONATE NOW",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      RaisedButton(
                        color: Colors.red,
                        onPressed: () {},
                        child: Text("EMERGENCY",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
              child: Text(
                "SYMPTOMS OF COVID-19",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 150,
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            //color: Colors.bl,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _boxContaineer("assets/1.png", "Fever"),
                _boxContaineer("assets/2.png", "Dry Cought"),
                _boxContaineer("assets/3.png", "Headache"),
                _boxContaineer("assets/4.png", "Breathless"),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Text(
                "PREVENTION",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: 150,
            padding: EdgeInsets.only(top: 15.0, right: 15.0, left: 8.0),
            //color: Colors.bl,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _boxContaineer("assets/a10.png", "WASH often"),
                _boxContaineer("assets/a3.png", "Dry Cought"),
                //_boxContaineer("assets/a4.png", "COVER \nyour cough"),
                _boxContaineer("assets/a6.png", "ALAWAS clean"),
                _boxContaineer("assets/a8.png", "KEEP distance"),
                _boxContaineer("assets/a9.png", "USE mask"),
                _boxContaineer("assets/a2.png", "STAY home"),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                padding:
                    EdgeInsets.symmetric(horizontal: 120.0, vertical: 20.0),
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => StatPage(),
                    ),
                  );
                },
                child: Text("STATISTICS",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxContaineer(String name, String dis) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          padding: EdgeInsets.only(left: 50.0, right: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blue.withOpacity(.7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            image: DecorationImage(
              image: AssetImage(name),
            ),
          ),
        ),
        Text(
          dis,
          style: TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
