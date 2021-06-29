import 'package:areclambord_client_new/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InventoryScreen extends StatefulWidget {
  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {

  List<DropdownMenuItem<int>> listDrop = [];

  String valuechoose;
  List listItem = [
    "Item 01", "Item 02", "Item 03", "Item 04", "Item 05"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Text("Inventory", style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),

              Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor, width: 1),
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
            ],
          ),
        ),
      ),
    );
  }
}