// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kBottomHeight,
        margin: const EdgeInsets.only(top: 15.0),
        decoration: const BoxDecoration(
          color: kBottomCardColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: kLargeTextStyle,
          ),
        ),
      ),
    );
  }
}
