import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key});

  @override
  State<CurrencyConvertor> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConvertor> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 81;
    });
  }

  // To avoid the data leaks
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ---------------------------------------------------
    final borderVar = OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 1.5,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(10));
    // ----------------------------------------------------

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${(result != 0)  ? result.toStringAsFixed(3): result.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),

              TextField(
                style: const TextStyle(color: Colors.black),
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Please enter the amount in USD',
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: borderVar,
                  enabledBorder: borderVar,
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),

              //   Convert Button

              const SizedBox(height: 10.0),
              TextButton(
                onPressed: convert,
                // style: ButtonStyle( //We can use TextButton.styleFrom
                //   backgroundColor: const WidgetStatePropertyAll(Colors.black),
                //   foregroundColor: const WidgetStatePropertyAll(Colors.white),
                //   minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
                //   shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10)
                //   ),),
                // ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Convert'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
