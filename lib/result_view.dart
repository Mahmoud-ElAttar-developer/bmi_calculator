import 'package:bmi_calculator/colors.dart';
// import 'package:bmi_calculator/home_view.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.age, required this.res});
  final double res;
  final int age;

  //   Severe Thinness	< 16
  // Moderate Thinness	16 - 17
  // Mild Thinness	17 - 18.5
  // Normal	18.5 - 25
  // Overweight	25 - 30
  // Obese Class I	30 - 35
  // Obese Class II	35 - 40
  // Obese Class III	> 40

  String getClass() {
    String status = "";
    if (res < 16) {
      status = "Severe Thinness";
    } else if (res >= 16 && res <= 17)
      status = "Moderate Thinness";
    else if (res > 17 && res <= 18.5)
      status = "Mild Thinness";
    else if (res > 18.5 && res <= 25)
      status = "Normal";
    else if (res > 25 && res <= 30)
      status = "Overweight";
    else if (res > 30 && res <= 35)
      status = "Obese Class I";
    else if (res > 35 && res <= 40)
      status = "Obese Class II";
    else if (res > 40)
      status = "Obese Class III";

    // إضافة تأثير السن على الرسالة
    if (age < 18) {
      return "$status (Age: $age)";
    }
    return status;
  }

  String getAdvice() {
    String advice = "";

    if (res >= 18.5 && res <= 25) {
      advice = "Your body weight is absolutely normal. Good Job!";
    } else if (res < 18.5) {
      advice = "You are underweight. You should eat a bit more!";
    } else {
      advice = "You are overweight. Try to exercise more!";
    }

    // إضافة تأثير السن على النصيحة في سطر جديد
    if (age < 18) {
      advice =
          "\n(Note: As you are under 18, consult a doctor for a growing body plan)";
    }

    return advice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,

      appBar: AppBar(
        elevation: 0,
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.scaffoldBg,
        // title: Row(children: []),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.containerBg,
                    border: Border.all(),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your result is :',
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          getClass(),
                          style: TextStyle(
                            color: AppColors.greenColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          res.toStringAsFixed(2),
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            getAdvice(),
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // --------Button------
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 30, left: 10, right: 10),
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redcolor,
                  elevation: 0,

                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Navigator.of(context).pop(HomeView());
                },
                child: Text(
                  'Re-Calculate',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
