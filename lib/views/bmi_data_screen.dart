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
  int height = 150;
  int weight = 50;
  int age = 20;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: tertiaryColor,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: tertiaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
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
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "$weight",
                          style: numberTextStyle,
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
                              fillColor: secondaryColor,
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: tertiaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: 0,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                weight += 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: secondaryColor,
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: tertiaryColor,
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
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "$age",
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              // onPressed: (age == 20)
                              //     ? () => () {
                              //           age -= 1;
                              //           setState(() {});
                              //         }
                              //     : null,

                              onPressed: () {
                                age -= 1;
                                // (age < 1)
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: secondaryColor,
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30,
                              ),
                              child: const Icon(
                                Icons.remove,
                                color: tertiaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: 0,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                age += 1;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: secondaryColor,
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: tertiaryColor,
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
                    thumbColor: secondaryColor,
                    activeColor: primaryColor,
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: GenderCard(
                      borderColor:
                          (gender == "male") ? primaryColor : backgroundColor,
                      child: const GenderIconText(
                        icon: Icons.man,
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
                    child: GenderCard(
                      borderColor:
                          (gender == "female") ? primaryColor : backgroundColor,
                      child: const GenderIconText(
                        icon: Icons.woman,
                        title: 'FEMALE',
                      ),
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
              height: 60,
              width: 240,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor,
              ),
              child: const Center(
                  child: Text(
                "CALCULATE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: tertiaryColor,
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
  const BmiCard({Key? key, this.child, this.borderColor = backgroundColor})
      : super(key: key);
  final Widget? child;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: tertiaryColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(2, 4),
              )
            ]),
        margin: const EdgeInsets.all(15),
        child: child);
  }
}

class GenderCard extends StatelessWidget {
  const GenderCard({Key? key, this.child, this.borderColor = backgroundColor})
      : super(key: key);
  final Widget? child;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: tertiaryColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
                offset: Offset(2, 4),
              )
            ]),
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
          color: secondaryColor,
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
