import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF8d12fe),
        centerTitle: false,
        title: Text("Covid-19 Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              color: Colors.amber,
              child: Text("covid -19 mobile app"),
            ),
          ],
        ),
      ),
    );
  }
}
