// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

enum BmiCategory { underweight, normal, overweight, obesity }

// Map<String, String> _bmiType = {
//   "Underweight":
//       "You may be at an increased risk of developing complications, including bone, teeth, and fertility problems ",
//   "Normal": "You are healthy",
//   "OverWeight":
//       "may need to prevent further weight gain rather than lose weight",
//   "Obese": " it is recommended that you lose weight.",
// };

class CalculatorBrain {
  // final String type;
  // final String result;
  // final String resultRange;
  // final String interpretation;
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculatorBrain(
    // this.type,
    // this.result,
    // this.resultRange,
    // this.interpretation,
    this.height,
    this.weight,
  );

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  // String? getBMIType(int index) {
  //   return _bmiType[index];
  // }

  String getBmiType() {
    if (_bmi >= 30) {
      return BmiCategory.obesity.name.toUpperCase();
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return BmiCategory.overweight.name.toUpperCase();
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return BmiCategory.normal.name.toUpperCase();
    } else {
      return BmiCategory.underweight.name.toUpperCase();
    }
  }

  String getInterpretation() {
    if (_bmi >= 30) {
      return ("It is recommended that you lose weight.");
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return "You may need to prevent further weight gain rather than lose weight";
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "You are healthy. Thumbs up!!!";
    } else {
      return "You may be at an increased risk of developing complications, including bone, teeth, and fertility problems.";
    }
  }

  String getBmiTextRange() {
    if (_bmi >= 30) {
      return ("Obese BMI Range:");
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return "Overweight BMI Range:";
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "Normal BMI Range:";
    } else {
      return "Underweight BMI Range:";
    }
  }

  String getBmiRange() {
    if (_bmi >= 30) {
      return ">= 30 kg/m2";
    } else if (_bmi >= 25.0 && _bmi <= 29.9) {
      return "25.0 - 29.9 kg/m2";
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return "18.5 - 24.9 kg/m2";
    } else {
      return "< 18.5";
    }
  }
}
