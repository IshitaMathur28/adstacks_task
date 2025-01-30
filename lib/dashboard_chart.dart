import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardChart extends StatefulWidget {
  @override
  _DashboardChartState createState() => _DashboardChartState();
}

class _DashboardChartState extends State<DashboardChart> {
  late List<ChartData> chartDataPending;
  late List<ChartData> chartDataDone;

  @override
  void initState() {
    super.initState();
    chartDataPending = <ChartData>[];
    chartDataDone = <ChartData>[];
    _generateChartData();
  }

  void _generateChartData() {
    chartDataPending.addAll([
      ChartData(2015, 25),
      ChartData(2016, 15),
      ChartData(2017, 30),
      ChartData(2018, 20),
      ChartData(2019, 45),
      ChartData(2020, 35),
      ChartData(2023, 55),
    ]);

    chartDataDone.addAll([
      ChartData(2015, 35),
      ChartData(2016, 25),
      ChartData(2017, 40),
      ChartData(2018, 30),
      ChartData(2019, 55),
      ChartData(2020, 45),
      ChartData(2023, 48),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis( 
        labelStyle: const TextStyle(color: Color.fromARGB(255, 39, 67, 250)),
        minimum: 2015, 
        maximum: 2023, 
        interval: 1, 
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        interval: 10,
        labelStyle: const TextStyle(color: Colors.white),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      title: ChartTitle(
        text: 'Over All Performance\nThe Years',
        textStyle: const TextStyle(color: Color.fromARGB(255, 16, 89, 198), fontSize: 16),
      ),
      legend: Legend(
        isVisible: true,
        position: LegendPosition.top,
        alignment: ChartAlignment.center,
        textStyle: const TextStyle(color: Color.fromARGB(255, 16, 89, 198)),
      ),
      series: <LineSeries<ChartData, int>>[ 
        LineSeries<ChartData, int>( 
          dataSource: chartDataPending,
          xValueMapper: (ChartData data, _) => data.x, 
          yValueMapper: (ChartData data, _) => data.y, 
          color: const Color(0xFFF08A8C),
          width: 3,
          name: 'Pending',
          markerSettings: const MarkerSettings(
            isVisible: true,
            borderColor: Color(0xFFF08A8C),
          ),
        ),
        LineSeries<ChartData, int>( 
          dataSource: chartDataDone,
          xValueMapper: (ChartData data, _) => data.x, 
          yValueMapper: (ChartData data, _) => data.y, 
          color: const Color(0xFF7C8288),
          width: 3,
          name: 'Project Done',
          markerSettings: const MarkerSettings(
            isVisible: true,
            borderColor: Color(0xFF7C8288),
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y); 
  final int x; 
  final int y; 
}