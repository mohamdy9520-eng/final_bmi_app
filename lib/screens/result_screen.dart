import 'package:bmi_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';



class ResultScreen extends StatelessWidget {
  final double result;
  ResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(withLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Result",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff333244),
              ),
              child: Column(
                spacing: 60,
                children: [
                  Text(
                    getStatusText(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    result.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    statusBody,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8B8C9E),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String statusBody = "";
  String getStatusText() {
    if (result < 18.5) {
      statusBody =
          "You are under the normal body weight. Try to eat more balanced meals.";
      return "Under Weight";
    } else if (result >= 18.5 && result < 25) {
      statusBody =
          "You have a normal body weight. Good job maintaining a healthy lifestyle!";
      return "Normal Weight";
    } else if (result >= 25 && result < 30) {
      statusBody =
          "You are slightly overweight. Regular exercise is recommended.";
      return "Over Weight";
    } else {
      statusBody =
          "Your BMI indicates obesity. Please consult a healthcare professional.";
      return "Obese";
    }
  }
}
