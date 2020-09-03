import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {

  @override
   GoalsPageState createState() =>  GoalsPageState();
}

class  GoalsPageState extends State <GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _fadeText(),
        backgroundColor:  Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(color: Colors.cyan[600])
        ],
      ),
    );
  }//build

  Widget _fadeText(){
    return Container(
      margin: EdgeInsets.only(top:5),
      child: SizedBox(
        width: 250.0,
        child: FadeAnimatedTextKit(
          onTap: () {
              print("Tap Event");
            },
          text: [
            "¿Qué es lo realmente ",
            "importante?",
            "Vamos a hacerlo :)",
            "¿Qué has estado ",
            "dejando pendiente?"
          ],
          textStyle: TextStyle(
              fontSize: 25.0, 
              fontWeight: FontWeight.bold
          ),
          textAlign: TextAlign.start,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
        ),
    ),
  );
  }
}