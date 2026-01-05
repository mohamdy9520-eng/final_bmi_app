import 'dart:math';

import 'package:bmi_app/screens/result_screen.dart';
import 'package:bmi_app/widgets/custom_app_bar.dart';
import 'package:bmi_app/widgets/gender_container.dart';
import 'package:bmi_app/widgets/gender_info.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = false;
  bool isFemale = false;
  int height = 50;
  int weight = 30;
  int age = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              // Gender Row
              Row(
                children: [
                  GenderContainer(
                    title: "Male",
                    icon: Icons.male,
                    color: isMale ? Colors.red : const Color(0xff24263B),
                    onTap: () {
                      setState(() {
                        isMale = true;
                        isFemale = false;
                      });
                    },
                  ),
                  const SizedBox(width: 9),
                  GenderContainer(
                    title: "Female",
                    icon: Icons.female,
                    color: isFemale ? Colors.red : const Color(0xff24263B),
                    onTap: () {
                      setState(() {
                        isMale = false;
                        isFemale = true;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Height Container
              Container(
                width: double.infinity,
                height: 189,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff333244),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Height",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: height.toString(),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const TextSpan(
                            text: "cm",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 300,
                      activeColor: const Color(0xffE83D67),
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 29),

              // Data Row
              Row(
                children: [
                  GenderInfo(
                    title: "Weight",
                    number: weight,
                    increaseOnTap: () {
                      setState(() {
                        weight++;
                      });
                    },
                    decreaseOnTap: () {
                      setState(() {
                        if (weight > 30) {
                          weight--;
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 9),
                  GenderInfo(
                    title: "Age",
                    number: age,
                    increaseOnTap: () {
                      setState(() {
                        age++;
                      });
                    },
                    decreaseOnTap: () {
                      if (age > 10) {
                        setState(() {
                          age--;
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomAppBar(
          color: const Color(0xFFE83D66),
          child: InkWell(
            onTap: () {
              double finalHeight=height/100;
              double bmiResult=weight/pow(finalHeight, 2);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    result:bmiResult
                  ),
                ),
              );

              print("Calculate BMI");
            },
            child: const Center(
              child: Text(
                "CALCULATE",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
