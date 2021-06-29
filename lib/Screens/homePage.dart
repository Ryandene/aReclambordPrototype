import 'package:areclambord_client_new/Screens/inventory.dart';
import 'package:areclambord_client_new/Screens/myAnalysis.dart';
import 'package:areclambord_client_new/Screens/progress.dart';
import 'package:areclambord_client_new/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 11.5,
  ); 

  Widget button({@required Function ontap, @required String name}) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height*0.07,
      child: RaisedButton(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: new Text(
          name, 
          style: TextStyle(
            color: Colors.white,
            fontSize: 18
          )
        ),
        onPressed: ontap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Column(
                      children: [
                        new Text("Welcome to Vender Dashboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        Container(
                          width: 380,
                          height: 330,
                          child: new GoogleMap(
                            myLocationButtonEnabled: false,
                            zoomControlsEnabled: false,
                            initialCameraPosition: _initialCameraPosition
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        button(
                          name: "Inventory",
                          ontap: () {
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => InventoryScreen()));
                          }
                        ),
                        SizedBox(height: 10),
                        button(
                          name: "Purchase",
                          ontap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            // builder: (context) => Purz()));
                          }
                        ),
                        SizedBox(height: 10),
                        button(
                          name: "New Listings",
                          ontap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            // builder: (context) => SignUpScreen()));
                          }
                        ),
                        SizedBox(height: 10),
                        button(
                          name: "My Analysis",
                          ontap: () {
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MyAnalysisScreen()));
                          }
                        ),
                        SizedBox(height: 10),
                        button(
                          name: "Progress",
                          ontap: () {
                            Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ProgressScreen()));
                          }
                        ),
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}