import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class DataConsumption {
  final String age;
  final int data;
  final charts.Color barColor;

  DataConsumption(
    {@required this.age, this.data, this.barColor});
} 