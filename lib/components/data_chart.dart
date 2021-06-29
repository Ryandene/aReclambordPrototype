import 'package:areclambord_client_new/models/data_consumption.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Datachart extends StatelessWidget {
  final List<DataConsumption> data;

  const Datachart({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<DataConsumption, String>> series = [
      charts.Series(data: data, id: "DataConsumption", domainFn: (DataConsumption series, _) => series.age,
      measureFn: (DataConsumption series, _) => series.data, 
      colorFn: (DataConsumption series, _) => series.barColor
      )
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20.0),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: charts.BarChart(
                series, 
                animate: true,
              ),)
          ],
        ),
      ),
    );
  }

}