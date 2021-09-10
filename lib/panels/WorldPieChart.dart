import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WorldPieChart extends StatefulWidget {
  final Map data;

  const WorldPieChart({Key key, this.data}) : super(key: key);
  @override
  _LocalPieChartState createState() => _LocalPieChartState();
}

class _LocalPieChartState extends State<WorldPieChart> {
  List<Data> _chartData;
  TooltipBehavior _tooltipBehavior;
  //Map data;
  //get data => null;

  @override
  // ignore: missing_return
  Void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfCircularChart(
        title: ChartTitle(
            text: "GLOBAL STATS\n last update :" +
                widget.data["data"]["update_date_time"]),
        backgroundColor: Colors.black26,
        palette: <Color>[
          Colors.amber,
          Colors.blueAccent,
          Colors.green,
          Colors.redAccent,
        ],
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
          ),
        ],
      ),
    );
  }

  List<Data> getChartData() {
    final List<Data> chartData = [
      Data("Total Cases", widget.data["data"]["global_total_cases"]),
      Data(
          "Total Active",
          (widget.data["data"]["global_total_cases"] -
              (widget.data["data"]["global_recovered"]) -
              (widget.data["data"]["global_deaths"]))),
      Data("Total Recovered", widget.data["data"]["global_recovered"]),
      Data("Total Death", widget.data["data"]["global_deaths"])
    ];
    return chartData;
  }
}

class Data {
  final String continent;
  final int gdp;

  Data(this.continent, this.gdp);
}
