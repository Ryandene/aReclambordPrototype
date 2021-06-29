import 'package:areclambord_client_new/components/constants.dart';
import 'package:areclambord_client_new/components/data_chart.dart';
import 'package:areclambord_client_new/models/data_consumption.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyAnalysisScreen extends StatefulWidget {
  @override
  _MyAnalysisScreenState createState() => _MyAnalysisScreenState();
}

class _MyAnalysisScreenState extends State<MyAnalysisScreen> {

  List<DropdownMenuItem<int>> listDrop = [];

  String valuechoose;
  List listItem = [
    "Item 01", "Item 02", "Item 03", "Item 04", "Item 05"
  ];

  final List<DataConsumption> data = [
    DataConsumption(
      age: "children", 
      data: 540, barColor: 
      charts.ColorUtil.fromDartColor(kPrimaryColor)
    ),
    DataConsumption(
      age: "Youngsters", 
      data: 200, barColor: 
      charts.ColorUtil.fromDartColor(Colors.yellow)
    ),
    DataConsumption(
      age: "Adults", 
      data: 350, barColor: 
      charts.ColorUtil.fromDartColor(kPrimaryColor)
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("My Analysis",
                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
              ),

              SizedBox(height: 20.0),

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

              Datachart(data: data,),
              
            ],
          ),
        ),
      ),
    );
  }
}