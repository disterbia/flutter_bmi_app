
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData icon; //stateless는 다시그려지지않기떄문에 일반변수는 못만듬
  final onPressed;

  const RoundIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      fillColor: Colors.grey[700],
      shape: CircleBorder(),
      constraints:BoxConstraints.tightFor(width: 56.0 ,height: 56.0) ,
    );
  }
}
