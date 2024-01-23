import 'package:flutter/material.dart';
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import 'constants.dart';


class weightAndAgeCalculator extends StatelessWidget {
   weightAndAgeCalculator({required this.weight, required this.age,required this.onPress1,required this.onPress2});
   int  weight = 60;
   String  age;
   final VoidCallback  onPress1;
   final VoidCallback  onPress2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          age,
          style: kLabelImage,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              weight.toString(),
              style: kHeight,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              constraints: BoxConstraints.tightFor(
                width: 56.0,
                height: 56.0,
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              fillColor: Color(0xFF4C4F5E),
              onPressed: onPress1,
              child: Icon(FontAwesomeIcons.minus),
            ),
            SizedBox(
              width: 20,
            ),
            RawMaterialButton(
              constraints: BoxConstraints.tightFor(
                width: 56.0,
                height: 56.0,
              ),
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              fillColor: Color(0xFF4C4F5E),
              onPressed: onPress2,
              child: Icon(FontAwesomeIcons.plus),
            ),
          ],
        )
      ],
    );
  }
}


