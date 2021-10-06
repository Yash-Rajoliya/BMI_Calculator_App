
import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height, this.weight});

  final  int height;
  final int weight;
        double _bmi;


  String getResults() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultCondition() {
    if ( _bmi >= 25){
      return 'High';
    }else if (_bmi > 18.5){
      return 'Normal';
    }else {
      return 'Low';
    }
  }

  String getResultSuggestion() {
    if ( _bmi >= 25 ){
      return 'You need to exercise , your BMI is high';
    }
    else if ( _bmi > 18.5 ){
      return  'Keep up the good work , your BMI is normal ';
    }else {
      return 'You need to eat more , your BMI is low';
    }
  }
}