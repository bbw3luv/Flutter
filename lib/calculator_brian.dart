import 'dart:math';
class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({required this.height, required this.weight});
   double _bmi = 0;

  String  calculateBmi(){
    double _bmi = weight /pow(height/100,2);
    return _bmi.toStringAsFixed(1);

  }
  String getResult(){
    if (_bmi < 18.5) {
      return'Underweight';
    } else if (_bmi >= 18.5 && _bmi < 24.9) {
      return 'Normal';
    } else if (_bmi >= 25 && _bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String resultInterpretation(){
    if (_bmi < 18.5) {
      return'You are Underweight';
    } else if (_bmi >= 18.5 && _bmi < 24.9) {
      return 'Your Weight is Normal';
    } else if (_bmi >= 25 && _bmi < 29.9) {
      return 'You are Overweight';
    } else {
      return 'You are Obese';
    }

  }

}
