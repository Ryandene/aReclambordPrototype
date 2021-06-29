import 'package:areclambord_client_new/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuyerDashBoard extends StatefulWidget {
  @override
  _BuyerDashBoardState createState() => _BuyerDashBoardState();
}

class _BuyerDashBoardState extends State<BuyerDashBoard> {
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
                        new Text("Welcome to Buyer Dashboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Column(
                      children: [
                        button(
                          name: "Purchasings",
                          ontap: () {
                          }
                        ),
                        SizedBox(height: 20),
                        button(
                          name: "New Listings",
                          ontap: () {
                          }
                        ),
                        SizedBox(height: 20),
                        button(
                          name: "My Analysis",
                          ontap: () {
                          }
                        ),
                        SizedBox(height: 20),
                        button(
                          name: "Progress",
                          ontap: () {
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