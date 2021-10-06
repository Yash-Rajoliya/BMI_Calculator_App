import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  String resulttext ;
  String resultnumber ;
  String resultsuggestion;

  ResultsPage({ @required this.resulttext, @required  this.resultnumber, @required this.resultsuggestion});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10.0),
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Results',style: TextStyle(fontSize: 50.0))),
          Container(
            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 100.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),color: kActivecardcolor,),
            child: Column(
              children: [
                Text(resulttext, style: kLabelTextStyle,),
                SizedBox(height: 20.0),
                Text(resultnumber,style: TextStyle(fontSize: 100.0,color: kBottomContainerColor)),
                SizedBox(height: 20.0),
                Text(resultsuggestion,style: kLabelTextStyle,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
