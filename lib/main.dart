import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late List<ChartSampleData> data;
  late TrackballBehavior _trackballBehavior;
  void initState(){
     data = [
      ChartSampleData(
          x: DateTime(2016, 01, 11),
          open: 98.97,
          high: 101.19,
          low: 95.36,
          close: 97.13),
      ChartSampleData(
          x: DateTime(2016, 01, 18),
          open: 98.41,
          high: 101.46,
          low: 93.42,
          close: 101.42),
      ChartSampleData(
          x: DateTime(2016, 01, 25),
          open: 101.52,
          high: 101.53,
          low: 92.39,
          close: 97.34),
      ChartSampleData(
          x: DateTime(2016, 02, 01),
          open: 96.47,
          high: 97.33,
          low: 93.69,
          close: 94.02),
      ChartSampleData(
          x: DateTime(2016, 02, 08),
          open: 93.13,
          high: 96.35,
          low: 92.59,
          close: 93.99),
      ChartSampleData(
          x: DateTime(2016, 02, 15),
          open: 95.02,
          high: 98.89,
          low: 94.61,
          close: 96.04),
      ChartSampleData(
          x: DateTime(2016, 02, 22),
          open: 96.31,
          high: 98.0237,
          low: 93.32,
          close: 96.91),
      ChartSampleData(
          x: DateTime(2016, 02, 29),
          open: 96.86,
          high: 103.75,
          low: 96.65,
          close: 103.01),
      ChartSampleData(
          x: DateTime(2016, 03, 07),
          open: 102.39,
          high: 102.83,
          low: 100.15,
          close: 102.26),
      ChartSampleData(
          x: DateTime(2016, 03, 12),
          open: 106.5,
          high: 106.5,
          low: 110.5,
          close: 109.5),
       ChartSampleData(
           x: DateTime(2016, 03, 17),
           open: 109.5,
           high: 109.5,
           low: 112.5,
           close: 110.5),
       ChartSampleData(
           x: DateTime(2016, 03, 22),
           open: 111.5,
           high: 111.5,
           low: 114.5,
           close: 111.5),
       ChartSampleData(
           x: DateTime(2016, 03, 25),
           open: 113.5,
           high: 113.5,
           low: 116.5,
           close: 113.5),
    ];
     _trackballBehavior = TrackballBehavior(enable: true);
     super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('chart'),
        ),
        body: Center(
          child: Container(
              height: 500,
              width: 600,
              child: SfCartesianChart(
                enableAxisAnimation: true,
                  backgroundColor: Colors.black,
                  primaryXAxis: DateTimeAxis(
                      visibleMinimum: DateTime(2016, 01, 8),
                      visibleMaximum: DateTime(2016, 03, 16),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,
                      intervalType: DateTimeIntervalType.days,
                      majorGridLines: MajorGridLines(width: 0)),
                  tooltipBehavior: TooltipBehavior(
                    enable: true,
                    header: 'Heart Rate (bpm)',
                  ),
                  zoomPanBehavior: ZoomPanBehavior(enablePinching: true),


                  primaryYAxis: NumericAxis(interval: 20),
                  trackballBehavior: _trackballBehavior,
                  series: <ChartSeries<ChartSampleData, DateTime>>[
                    CandleSeries<ChartSampleData, DateTime>(
                      dataSource: data,
                      xValueMapper: (ChartSampleData sales, _) => sales.x,
                      lowValueMapper: (ChartSampleData sales, _) => sales.low,
                      highValueMapper: (ChartSampleData sales, _) => sales.high,
                      openValueMapper: (ChartSampleData sales, _) => sales.open,
                      closeValueMapper: (ChartSampleData sales, _) =>
                      sales.close,
                      name: 'Sales',
                    )
                  ])),
        ));
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.open, this.high, this.low, this.close});

  final DateTime? x;
  final double? open;
  final double? high;
  final double? low;
  final double? close;
}