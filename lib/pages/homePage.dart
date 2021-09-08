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
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue,
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
        ],
      ),
    );
  }
}
