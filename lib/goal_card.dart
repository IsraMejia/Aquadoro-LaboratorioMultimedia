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
       margin: EdgeInsets.all(10),
       width: anchoPantalla * 0.9,
       decoration: BoxDecoration(
         color: Color.fromRGBO(223, 255, 255, 1),
         borderRadius: BorderRadius.circular(15.0),
       ),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             padding: EdgeInsets.only(left: 10, bottom: 13),
             child:  _actividadInput(),
             width: anchoPantalla*0.45,
           ),
           Spacer(),
           Container(
             padding: EdgeInsets.only(left: 10, bottom: 13),
             child:  _inputConcentracion(),
             width: anchoPantalla*0.15,
           ),
           Spacer(),
           Container(
             padding: EdgeInsets.only(left: 10, bottom: 13),
             child:  _inputDescanso(),
             width: anchoPantalla*0.15,
           ),
         ],
       ),
     ),
   );
  }//build
  Widget _actividadInput(){
    return TextFormField (
      decoration: InputDecoration(
        labelText: "Actividad",
        labelStyle: TextStyle( fontSize: 13),
      ),
      onChanged: (activity){
        print(activity);
      },
    );
  }// _actividad Input
  
  Widget _inputConcentracion(){
    return TextFormField (
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Focus",
        labelStyle: TextStyle( fontSize: 13),
      ),
      onChanged: (tiempoConcentracion){
        print(tiempoConcentracion);
      },
    );
  }

  Widget _inputDescanso(){
    return TextFormField (
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Relax",
        labelStyle: TextStyle( fontSize: 13),
      ),
      onChanged: (tiempoDescanso){
        print(tiempoDescanso);
      },
    );
  }
}