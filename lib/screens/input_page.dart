import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:bmi_app/components/round_icon_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class inputPage extends StatefulWidget {
  @override
  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMICALCULATOR'))),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                mColor: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.mars,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'MALE',
                      style: kLabelTextStyle, //디자인이름은 k를붙인다.
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                mColor: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.venus,
                      size: 80.0,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'Female',
                      style: kLabelTextStyle, //디자인이름은 k를붙인다.
                    )
                  ],
                ),
              )),
            ],
          ),
          Expanded(
            child: ReusableCard(
              mColor: kActiveCardColor,
              cardChild: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: height.toString(),
                                style: kNumberTextStyle),
                            TextSpan(text: 'cm', style: kLabelTextStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbColor: Colors.pink,
                          overlayColor: Color(0x1FEB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 20.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ))
                ],
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  children: <Widget>[
                    Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)),
                        Expanded(
                            child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                                icon: FontAwesomeIcons.minus)),
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                cardChild: Column(
                  children: <Widget>[
                    Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                                icon: FontAwesomeIcons.plus)),
                        Expanded(
                            child: RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age = age - 1;
                                  });
                                },
                                icon: FontAwesomeIcons.minus)),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                          )));
            },
            buttonTitle: 'Calculate',
          )
        ],
      ),
    );
  }
}
