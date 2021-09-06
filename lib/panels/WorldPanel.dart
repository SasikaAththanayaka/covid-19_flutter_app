import 'package:flutter/material.dart';

class WorldPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          StatusPanel(),
          StatusPanel(),
          StatusPanel(),
          StatusPanel(),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
