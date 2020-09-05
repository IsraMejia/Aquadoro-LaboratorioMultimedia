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
  String tipoActividad = 'Focus';
  String tiempoPantalla = '12:00';

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Aquadoro'),
        backgroundColor: Colors.cyan[600],
      ),
      body: Stack(
        children: [
          Container(color: Colors.cyan[600]),
          _aquadoroStack(ancho),
        ],
      ),
    );
  }

  Widget _aquadoroStack(double ancho) {
    return Stack(
      children: <Widget>[
        Container(
          width: 357,
          height: 357,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
                image: AssetImage("assets/Acuadoro.png"), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 160,
          left: ancho * 0.25,
          child: Container(
            height: 100,
            width: 170,
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    tipoActividad,
                    style: TextStyle(fontSize: 25, color: Colors.blueGrey[50]),
                  ),
                ),
                Center(
                  child: Text(
                    tiempoPantalla,
                    style: TextStyle(fontSize: 25, color: Colors.blueGrey[50]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
