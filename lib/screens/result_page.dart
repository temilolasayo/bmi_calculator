// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/components/bottom__button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.result,
    required this.type,
    required this.resultRange,
    required this.resultTextRange,
    required this.interpretation,
  }) : super(key: key);

  final String result;
  final String type;
  final String resultRange;
  final String resultTextRange;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("YOUR RESULT"),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const Expanded(
          //   child: Text(
          //     "Your Result",
          //     style: kLargeTextStyle,
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          Expanded(
            // flex: 5,
            child: ReusableCard(
                color: kActiveColor,
                cardChild: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        type,
                        style: kGreenTextStyle,
                      ),
                      Text(
                        result.toString(),
                        style: kNumberTextStyle
                            .merge(const TextStyle(fontSize: 100.0)),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        resultTextRange,
                        style: kInActiveText,
                      ),
                      Text(
                        resultRange,
                        style: kInActiveText
                            .merge(const TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        interpretation,
                        style: kInActiveText.merge(
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      // const SizedBox(
                      //   height: 50.0,
                      // ),
                      // TextButton(
                      //   style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStateProperty.all(kInActiveColor),
                      //   ),
                      //   onPressed: () => {},
                      //   child: const Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: 15.0, horizontal: 25.0),
                      //     child: Text(
                      //       'SAVE RESULT',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                onPress: () {}),
          ),
          BottomButton(
              buttonText: "RE-CALCULATE YOUR BMI",
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
