import 'package:covid_19_dashboard/panels/WorldPieChart.dart';
import 'package:flutter/material.dart';

//import 'LocalPieChart.dart';

class WorldPanel extends StatelessWidget {
  final Map data;

  const WorldPanel({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .528,
          child: data == null
              ? CircularProgressIndicator()
              : WorldPieChart(
                  data: data,
                ),
        ),
        Container(
          color: Colors.black26,
          child: GridView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2),
            children: <Widget>[
              StatusPanel(
                title: "CONFORMED",
                panelColor: Colors.amber,
                textColor: Colors.white,
                count: data["data"]["global_total_cases"].toString(),
              ),
              StatusPanel(
                title: "ACTIVE",
                panelColor: Colors.blue,
                textColor: Colors.white,
                count: (data["data"]["global_total_cases"] -
                        (data["data"]["global_recovered"]) -
                        (data["data"]["global_deaths"]))
                    .toString(),
              ),
              StatusPanel(
                title: "RECOVERD",
                panelColor: Colors.green,
                textColor: Colors.white,
                count: data["data"]["global_recovered"].toString(),
              ),
              StatusPanel(
                title: "DEATHS",
                panelColor: Colors.red,
                textColor: Colors.white,
                count: data["data"]["global_deaths"].toString(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 80.0,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
