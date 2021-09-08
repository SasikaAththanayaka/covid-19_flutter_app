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
      body: Container(),
    );
  }
}
