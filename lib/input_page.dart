import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_widgets.dart';
import 'constants.dart';
import 'ResultsPage.dart';
import 'bmicalculator_brain.dart';





class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedgender ;
  int Height = 180;
  int Weight = 60 ;
  int Age = 22 ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPressed: (){
                        setState(() {
                          selectedgender = Gender.male;
                        });
                      },
                      Colour: selectedgender == Gender.male ? kActivecardcolor : kInactivecardcolor ,
                      cardChild: CardChildContent(
                        CardIcon: FontAwesomeIcons.mars,
                        CardText: 'Male',
                      ),),
                ),
                Expanded(
                  child: ReusableCard(
                      onPressed: (){
                        setState(() {
                          selectedgender = Gender.female;
                        });
                      },
                      Colour: selectedgender == Gender.female ? kActivecardcolor : kInactivecardcolor ,
                      cardChild: CardChildContent(
                        CardIcon: FontAwesomeIcons.venus,
                        CardText: 'Female',
                      ),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                        Colour: kReusableCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Height',
                             style: kLabelTextStyle ,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text( Height.toString(),
                                  style: kNumberTextStyle,),
                                Text('cm',
                                  style: kLabelTextStyle,),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Color(0xFFEB1555),
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

    ),
                              child: Slider(value: Height.toDouble(),
                                  min: 120.0,
                                  max: 220.0,
                                  inactiveColor: Color(0xFF8D8E98),
                                  onChanged: (double NewValue){
                                    setState(() {
                                      Height = NewValue.round();
                                    });
                                  }),
                            )
                          ],
                        ) ,)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                      Colour: kReusableCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight',style: kLabelTextStyle,),
                          Text(Weight.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundActionButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    Weight--;
                                  });
                                },
                              ),
                              SizedBox(width: 15.0),
                              RoundActionButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    Weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),)),
                Expanded(child: ReusableCard(
                    Colour: kReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: kLabelTextStyle,),
                        Text(Age.toString(),style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  Age--;
                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            RoundActionButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  Age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                     )),
              ], 
            ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: Height , weight: Weight );
              print(calc.getResults());
              print(calc.getResultCondition());
              print(calc.getResultSuggestion());

              Navigator.push(context,MaterialPageRoute(builder: (context) => ResultsPage(
                resulttext: calc.getResultCondition(),
                resultnumber: calc.getResults() ,
                resultsuggestion: calc.getResultSuggestion(),
              ) ));
            },
            child: Container(
              child: Center(child: Text('CALCULATE',style: TextStyle(fontSize: 20.0),)),
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight ,
            ),
          )
        ],
      ),
    );
  }
}


