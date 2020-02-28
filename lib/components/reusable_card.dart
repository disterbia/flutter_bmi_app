
import 'package:bmi_app/constants.dart';
import 'package:flutter/material.dart';



class ReusableCard extends StatelessWidget {

  final Color mColor;
  final Function onPress;
  final Widget cardChild;


  const ReusableCard({@required this.mColor,@required this.onPress,@required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: cardChild,
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color:mColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
