// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/components/bottom__button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/reusable_column.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';

import '../models/calculator_brain.dart';

enum Gender { female, male }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  late int selectedWeight;
  late int selectedAge;

  int height = 180;
  int weight = 74;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color:
                        gender == Gender.male ? kActiveColor : kInActiveColor,
                    cardChild: const IconContent(
                      icon: Icons.male,
                      label: "Male",
                    ),
                    onPress: () {
                      setState(
                        () {
                          gender = Gender.male;
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color:
                        gender == Gender.female ? kActiveColor : kInActiveColor,
                    cardChild: const IconContent(
                      icon: Icons.female,
                      label: "Female",
                    ),
                    onPress: () {
                      setState(
                        () {
                          gender = Gender.female;
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "CM",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  )
                ],
              ),
              onPress: () => {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () => {},
                    color: kActiveColor,
                    cardChild: ReusableColumn(
                      value: weight.toString(),
                      text: "Weight",
                      increaseNumber: () {
                        weight = weight + 1;
                        setState(() {
                          selectedWeight = weight;
                        });
                      },
                      decreaseNumber: () {
                        weight = weight - 1;
                        setState(() {
                          selectedWeight = weight;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveColor,
                    cardChild: ReusableColumn(
                      value: age.toString(),
                      text: "Age",
                      increaseNumber: () {
                        age = age + 1;
                        setState(() {
                          selectedAge = age;
                        });
                      },
                      decreaseNumber: () {
                        age = age - 1;
                        setState(() {
                          selectedAge = age;
                        });
                      },
                    ),
                    onPress: () => {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonText: "CALCULATE",
              onTap: () {
                CalculatorBrain calculate = CalculatorBrain(
                  height,
                  weight,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: calculate.calculateBMI(),
                      type: calculate.getBmiType(),
                      interpretation: calculate.getInterpretation(),
                      resultRange: calculate.getBmiRange(),
                      resultTextRange: calculate.getBmiTextRange(),
                    ),
                  ),
                );
              }),
          // const Row(
          //   children: [
          //     BottomCard(),
          //   ],
          // ),
        ],
      ),
    );
  }
}
