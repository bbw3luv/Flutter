import 'package:bmi_calculator/Reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

import 'bottom.dart';
class ResultPage  extends StatelessWidget {
  ResultPage({ required this.bmiResult,required this.resulText, required this.readResult});
  final String bmiResult;
  final String resulText;
  final String readResult;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text("Your Result",
            style: kLargeButtonTextStyle,),
          )),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resulText,
                    style: kResultTextStyle,),
                    Text(bmiResult,
                    style: kBmiTextStyle,),
                    Text(readResult,
                    style: kBodyTextStyle,),
                    Container(
                      child: GestureDetector(
                        onTap: ()=> Navigator.pop(context),
                        child: Bottom(label: "RE-CACULATE",),
                      ),
                      padding: EdgeInsets.only(bottom: 20.0),
                      color: kBottomContainerColor,
                      margin: EdgeInsets.only(top: 10.0),
                      width: double.infinity,
                      height: kBottomContainerHeight,
                    ),

                  ],
                ),
              ))
        ],
      ),
    );
  }
}
