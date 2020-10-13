import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: SfCircularChart(
          title: ChartTitle(text: 'Sales by sales person'),
          legend: Legend(isVisible: true),

          series: <DoughnutSeries<_PieData, String>>[
              DoughnutSeries<_PieData, String>(
                legendIconType: LegendIconType.diamond,
                explode: true,
                explodeIndex: 0,
                dataSource: chartData,
                xValueMapper: (_PieData data, _) => data.xData,
                yValueMapper: (_PieData data, _) => data.yData,
                dataLabelMapper: (_PieData data, _) => data.text,
                dataLabelSettings: DataLabelSettings(isVisible: true)
            ),
          ]
        )
    );
  }
}

final List<_PieData> chartData = <_PieData>[
   _PieData('aw', 23, 'Icon(Icons.ac_unit)'),
   _PieData('yow', 35, 'Icon(Icons.ac_unit)'),
   _PieData('yeah', 19, 'Icon(Icons.ac_unit)'),
   _PieData('yeah', 23, 'Icon(Icons.ac_unit)')
 ];


class _PieData {
 _PieData(this.xData, this.yData, [this.text]);
 final String xData;
 final num yData;
 final String text;
}



