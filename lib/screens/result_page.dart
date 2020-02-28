import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMICALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Center(
                    child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ))),
            Expanded(
                child: Center(
                    child: Text(
                      resultText,
              style: kResultTextStyle,
            ))),
            Expanded(
                child: Center(
                    child: Text(
                      bmiResult,
              style: kBMITextStyle,
            ))),
            Expanded(
                child: Center(
                    child: Text(
                      interpretation,
              style: kBodyTextStyle,
              textAlign: TextAlign.center,
            ))),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },buttonTitle: 'Re-Calculate',
            )
          ],
        ));
  }
}
