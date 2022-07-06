import 'package:flutter/material.dart';

// merah 0xfffe1801
// hijau 0xff57c89d
// biru 0xff02adff

const Color backgroundColor = Color(0xfff8f8f8);
const Color primaryColor = Color(0xff02adff);
const Color secondaryColor = Color(0xff15151d);
const Color tertiaryColor = Color(0xffffffff);

AppBar appBar = AppBar(
  centerTitle: true,
  automaticallyImplyLeading: false,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        'images/rebahan.png',
        width: 30,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        "BMI Calculator",
        style: titleTextStyle,
      ),
    ],
  ),
);

TextStyle titleTextStyle = const TextStyle(
  fontWeight: FontWeight.bold,
  color: tertiaryColor,
);

TextStyle? labelTextStyle = const TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.bold,
  color: secondaryColor, //Color(0xff8d8e98),
);
TextStyle numberTextStyle = const TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);

const String underweightSevere = "Underweight (Severe thinness)";
const String underweightModerate = "Underweight (Moderate thinness)";
const String underweightMild = "Underweight (Mild thinness)";
const String normal = "Normal";
const String overweight = "Overweight";
const String obeseI = "Obese (Class I)";
const String obeseII = "Obese (Class II)";
const String obeseIII = "Obese (Class III)";
