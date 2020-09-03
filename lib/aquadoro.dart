import 'package:flutter/material.dart';

class Aquadoro extends StatefulWidget {

  Aquadoro({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
  });

  final String actividad;
  final int tConcentracion;
  final int tDescanso;

  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aquadoro'),
        backgroundColor:  Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(color: Colors.cyan[600]),
          Column(

            children: [
              Center(child: Text('Hola xD')),
              Center(child: Text('Actividad: ${widget.actividad}', style: TextStyle(
                fontSize: 25, color: Colors.blueGrey[50]
              ),)),
              Center(child: Text('tconcentracion :${widget.tConcentracion}', style: TextStyle(
                fontSize: 25, color: Colors.blueGrey[50]
              ),)),
              Center(child: Text('tDescanso : ${widget.tDescanso}', style: TextStyle(
                fontSize: 25, color: Colors.blueGrey[50]
              ),)),

            ],
          ),
        ],
      ),
    );
  }
}