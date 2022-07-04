import 'package:bmi/constant/constant.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);
  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "male") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.male,
                        title: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor:
                          (gender == "female") ? Colors.white : primaryColor,
                      child: const GenderIconText(
                        icon: Icons.female,
                        title: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle!.copyWith(),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "$height",
                        style: numberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 80,
                    max: 200,
                    thumbColor: const Color(0xffEC3C66),
                    activeColor: Colors.white,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          "$weight",
                          style: numberTextStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight -= 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.white12,
                              constraints: const BoxConstraints.tightFor(
                                width: 45,
                                height: 45,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                weight += 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.white12,
                              constraints: const BoxConstraints.tightFor(
                                width: 45,
                                height: 45,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          "$age",
                          style: numberTextStyle,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                age -= 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.white12,
                              constraints: const BoxConstraints.tightFor(
                                width: 45,
                                height: 45,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                age += 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.white12,
                              constraints: const BoxConstraints.tightFor(
                                width: 45,
                                height: 45,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              final bmiCalculator =
                  BmiCalculator(height: height, weight: weight);
              bmiCalculator.calculateBMI();

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return BmiResultScreen(
                      bmi: bmiCalculator.bmi!,
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 80,
              color: const Color(0xffEC3C66),
              child: const Center(
                  child: Text(
                "HITUNG BMI",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({Key? key, this.child, this.borderColor = primaryColor})
      : super(key: key);
  final Widget? child;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: const Color(0xff131734),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor),
        ),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
