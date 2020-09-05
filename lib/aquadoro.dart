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
  String tiempoPantalla;

  @override
  void initState() {
    super.initState();
    tiempoPantalla = '${widget.tConcentracion.toString()}:00';
  }

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
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                _aquadoroStack(ancho),
                Expanded(child: Container()),
                _botones(),
                Expanded(child: Container()),
              ],
            ),
          ),
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

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.cyan[200],
            child: Row(
              children: <Widget>[
                Text(
                  'Reset',
                  style: TextStyle(fontSize: 25, color: Colors.teal[900]),
                ),
                Icon(
                  Icons.rotate_left,
                  size: 25,
                  color: Colors.teal[900],
                ),
              ],
            ),
            onPressed: () {}),
        OutlineButton(
            borderSide: BorderSide(
                width: 3, color: Colors.blue[900], style: BorderStyle.solid),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: <Widget>[
                Text(
                  tipoActividad,
                  style: TextStyle(fontSize: 25, color: Colors.indigo[800]),
                ),
                Icon(
                  Icons.adjust,
                  size: 25,
                  color: Colors.blue[900],
                )
              ],
            ),
            onPressed: () {}),
      ],
    );
  }
}
