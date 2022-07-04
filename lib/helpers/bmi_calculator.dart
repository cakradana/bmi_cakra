import 'package:bmi/constant/constant.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDesc;
  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi);

  double calculateBMI() {
    double heightInMeter = height! / 100;
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;
    return bmi!;
  }

  determineBmiCategory() {
    bmiCategory = "";
    if (bmi! <= 16.0) {
      bmiCategory = underweightSevere;
    } else if (bmi! < 17) {
      bmiCategory = underweightModerate;
    } else if (bmi! < 18.5) {
      bmiCategory = underweightMild;
    } else if (bmi! < 25) {
      bmiCategory = normal;
    } else if (bmi! < 30) {
      bmiCategory = overweight;
    } else if (bmi! < 35) {
      bmiCategory = obeseI;
    } else if (bmi! < 40) {
      bmiCategory = obeseII;
    } else if (bmi! >= 40) {
      bmiCategory = obeseIII;
    }
    return bmiCategory;
  }

  getHealthRiskDesc() {
    bmiDesc = "";
    switch (bmiCategory) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
        bmiDesc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case normal:
        bmiDesc = "Low risk (healthy range).";
        break;
      case overweight:
        bmiDesc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      case obeseI:
      case obeseII:
      case obeseIII:
        bmiDesc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
        break;
      default:
    }
    return bmiDesc;
  }
}
