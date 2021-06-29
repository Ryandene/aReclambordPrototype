import 'package:areclambord_client_new/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<ProgressData> _chartData;

  List<DropdownMenuItem<int>> listDrop = [];

  String valuechoose;
  List listItem = [
    "Item 01", "Item 02", "Item 03", "Item 04", "Item 05"
  ];

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Progress",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
              ),

              SizedBox(height: 40.0),

              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor, width: 3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: new DropdownButton(
                    value: valuechoose,
                    hint: new Text("Select Type"),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    onChanged: (newValue) {
                      setState(() {
                        valuechoose = newValue;                      
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height:20.0),
              
              SfCartesianChart(
                series: <ChartSeries> [
                  LineSeries<ProgressData, double>(dataSource: _chartData,
                  xValueMapper: (ProgressData sales, _) => sales.week,
                  yValueMapper: (ProgressData sales, _) => sales.hits,
                  color: Colors.red)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  List<ProgressData> getChartData() {
    final List<ProgressData> chartData = [
      ProgressData(1, 25),
      ProgressData(2, 12),
      ProgressData(3, 24),
      ProgressData(4, 18),
      ProgressData(5, 30),
    ];
    return chartData;
  }

}

class ProgressData {
  ProgressData(this.week, this.hits);
  final double week;
  final double hits;
}
