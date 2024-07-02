import 'package:flutter/material.dart';
import 'package:some_test_app/currency_covertor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CurrencyConvertor()
    );
  }
}
