import 'package:bmi_app/constants.dart';
import 'package:bmi_app/screens/result_page.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final onTap;
  final buttonTitle;

  const BottomButton({this.onTap, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonTitle, style: kLargeButtonTextStyle)),
        color: Colors.pink,
        width: double.infinity, //Expanded 대신씀 위젯이 width를 제공해줄때.
        height: 70.0,
      ),
    );
  }
}
