import 'package:flutter/material.dart';


class CardChildContent extends StatelessWidget {

  CardChildContent({this.CardIcon,this.CardText});

  final IconData CardIcon ;
  final String CardText ;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(CardIcon, size: 80.0),
        SizedBox(height: 15.0),
        Text(CardText,style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF8D8E98),
        ),)
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard ({@required this.Colour, this.cardChild, this.onPressed});
  final Color Colour ;
  final cardChild ;
  Function onPressed ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Expanded(
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colour,
              borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}

class RoundActionButton extends StatelessWidget {

  RoundActionButton({@required this.icon,@required this.onPressed});

  final IconData icon ;
  final Function onPressed ;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
           shape: CircleBorder(),
           elevation: 0.0,
           child: Icon(icon),
           onPressed: onPressed,
           constraints: BoxConstraints.tightFor(
             width: 56.0,
             height: 56.0
           ),
          fillColor: Color(0xFF4C4F5E),

    );
  }
}

