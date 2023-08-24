// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReusableColumn extends StatelessWidget {
  const ReusableColumn({
    Key? key,
    required this.value,
    required this.text,
    required this.increaseNumber,
    required this.decreaseNumber,
  }) : super(key: key);

  final String value;
  final String text;
  final VoidCallback increaseNumber;
  final VoidCallback decreaseNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text.toUpperCase(),
          style: kLabelTextStyle,
        ),
        Text(
          value,
          style: kNumberTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            FloatingActionButton(
              heroTag: "decreaseButton",
              backgroundColor: const Color(0xFF4C4F5E),
              onPressed: decreaseNumber,
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            FloatingActionButton(
              heroTag: "increaseButton",
              backgroundColor: const Color(0xFF4C4F5E),
              onPressed: increaseNumber,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
