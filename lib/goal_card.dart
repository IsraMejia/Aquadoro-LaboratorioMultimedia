import 'package:flutter/material.dart';

class GoalCard extends StatefulWidget {
  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
  double anchoPantalla = MediaQuery.of(context).size.width;
    return Center(
     child: Container(
       margin: EdgeInsets.all(15),
       height: 100,
       width: anchoPantalla * 0.9,
       decoration: BoxDecoration(
         color: Color.fromRGBO(223, 255, 255, 1),
         borderRadius: BorderRadius.circular(15.0),
       ),
     ),
   );
  }
}