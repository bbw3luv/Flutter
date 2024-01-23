import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'Reusable_card.dart';
import 'constants.dart';
import 'weightAndAge.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'bottom.dart';
import 'calculator_brian.dart';
import 'result_page.dart';
enum GenderType { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  dynamic selectedGender;
  int height = 120;
  int weigh = 10;
  int age = 0;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.male;
                        });
                      },
                      cardChild: ReusableIcon(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                      colour: selectedGender == GenderType.male
                          ? kContainerColor
                          : kInactiveCardColor),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GenderType.female;
                        });
                      },
                      cardChild: ReusableIcon(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      colour: selectedGender == GenderType.female
                          ? kContainerColor
                          : kInactiveCardColor),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kContainerColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: labelImage,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(height.toString(), style: kHeight),
                            Text(
                              "cm",
                              style: kLabelImage,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kContainerColor,
                    cardChild: weightAndAgeCalculator(weight: weigh ,age:"WEIGHT Kg",
                      onPress1: () {setState(() {
                       if (weigh == -weigh  && weigh == 0){
                          Alert(context: context,
                            title: "WEIGHT",
                            desc: "Your Weight cant be Negative",
                            buttons:  [
                            DialogButton(
                            child: Text(
                            "CANCEL",
                            style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold , fontSize: 18),
                          ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                        ),

                            ],
                            style: AlertStyle(
                            backgroundColor: Colors.teal, // Set your desired background color
                          ),
                          ).show();
                       } else weigh--;
                      });},
                      onPress2: ()
                      {setState(() {
                        weigh++;
                      });},),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour: kContainerColor,
                    cardChild: weightAndAgeCalculator(
                      weight: age,age:"AGE",onPress1: () {
                        setState(() {
                          if (age == -age  && age == 0){
                            Alert(context: context,
                                title: "WEIGHT",
                                desc: "Your Age cant be Negative",
                                buttons:  [
                                  DialogButton(
                                    child: Text(
                                      "CANCEL",
                                      style: TextStyle(color: Colors.white, fontWeight:FontWeight.bold , fontSize: 18),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    color: Color.fromRGBO(0, 179, 134, 1.0),
                                  ),

                                ],
                              style: AlertStyle(
                                backgroundColor: Colors.teal, // Set your desired background color
                              ),

                            ).show();
                          } else age--;
                        });
                    },onPress2: (){setState(() {
                        age++;
                    });},),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: (){
                CalculatorBrain calculate = CalculatorBrain(height: height, weight: weigh);
                Navigator.push(context,MaterialPageRoute(
                  builder: (context) => ResultPage(
                  bmiResult: calculate.calculateBmi(),
                  resulText: calculate.getResult(),
                    readResult: calculate.resultInterpretation(),
                ),),
                );},
              child: Bottom(label: "CALCULATE",),
            ),
            padding: EdgeInsets.only(bottom: 20.0),
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          ),
        ],
      ),
    );
  }
}




