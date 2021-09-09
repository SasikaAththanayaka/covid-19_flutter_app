import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LocalPieChart extends StatefulWidget {
  final Map data;

  const LocalPieChart({Key key, this.data}) : super(key: key);
  @override
  _LocalPieChartState createState() => _LocalPieChartState();
}

class _LocalPieChartState extends State<LocalPieChart> {
  List<Data> _chartData;
  TooltipBehavior _tooltipBehavior;
  //Map data;
  //get data => null;

  @override
  // ignore: missing_return
  Void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<Data, String>(
            dataSource: _chartData,
            xValueMapper: (Data data, _) => data.continent,
            yValueMapper: (Data data, _) => data.gdp,
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          )
        ],
      ),
    );
  }

  List<Data> getChartData() {
    final List<Data> chartData = [
      Data("Total Cases", widget.data["data"]["local_total_cases"]),
      Data(
          "Total Active Cases",
          (widget.data["data"]["local_total_cases"] -
              (widget.data["data"]["local_recovered"]) -
              (widget.data["data"]["local_deaths"]))),
      Data("Total Recovered", widget.data["data"]["local_recovered"]),
      Data("Total Death", widget.data["data"]["local_deaths"])
    ];
    return chartData;
  }
}

class Data {
  final String continent;
  final int gdp;

  Data(this.continent, this.gdp);
}