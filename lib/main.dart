import 'package:areclambord_client_new/Screens/buyerDashboard.dart';
import 'package:areclambord_client_new/Screens/homePage.dart';
import 'package:areclambord_client_new/Screens/inventory.dart';
import 'package:areclambord_client_new/Screens/myAnalysis.dart';
import 'package:areclambord_client_new/Screens/progress.dart';
import 'package:areclambord_client_new/Screens/registration.dart';
import 'package:flutter/material.dart';

import 'Screens/login.dart';
import 'components/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      home: LoginScreen()
    );
  }
}
