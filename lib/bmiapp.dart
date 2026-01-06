import 'package:bmi_app/screens/home_screen.dart';
import 'package:flutter/material.dart';


class Bmiapp extends StatelessWidget{
  const Bmiapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1C2135),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        )
      ),
      home: HomeScreen(),
    );


  }
}