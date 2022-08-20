import 'package:bootcamp101/app/modules/bmi/input_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
          // primarySwatch:AppConstants.mainColor,
          ),
      debugShowCheckedModeBanner: false,
      home: BmiInputScreen(),
    );
  }
}
