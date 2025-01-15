
import 'package:flutter/material.dart';
import 'calculator_app.dart';
import 'init_calculator_app.dart';


Future<void> main() async {
  await initCalculatorApp();
  runApp(const CalculatorApp());
}
