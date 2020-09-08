import 'dart:async';

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
  int contador = 4;

  bool kindActivity = false;

  //variables para la funcionalidad del pomodoro

  int startState = 1;
  int tConcentracionSeg = 0;
  int tDescansoSeg = 0;

  bool revisarTiempoCon = false;
  bool revisarTiempoDes = false;

  bool botonDeshabilitado = false;
  bool resetDeshabilitado = false;

  @override
  void initState() {
    super.initState();
    tiempoPantalla = '${widget.tConcentracion.toString()}:00';
    resetDeshabilitado = true;
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
                SizedBox(height: 40),
                _contadorAcuadoro(),
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

  Widget _contadorAcuadoro() {
    switch (contador) {
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            )
          ],
        );

        break;

      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            )
          ],
        );

        break;

      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            )
          ],
        );
        break;

      case 4:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            )
          ],
        );

        break;

      case 5:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            ),
            Icon(
              Icons.av_timer,
              color: Colors.teal[50],
              size: 45,
            )
          ],
        );

        break;

      default:
        return Container(height: 45);
    }
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
        AbsorbPointer(
          absorbing: resetDeshabilitado,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
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
              onPressed: () {
                if (tConcentracionSeg > 1) {
                  revisarTiempoCon = true;
                  startState = 1;
                  print('Le diste en reset de focus');
                } else if (tDescansoSeg > 1) {
                  revisarTiempoDes = true;
                  startState = 1;
                  kindActivity = false;
                  tipoActividad = 'Focus';
                  tiempoPantalla = '${widget.tConcentracion.toString()}:00';
                  print('Le diste en reset de relax y te regresa a focus');
                }
              }),
        ),
        AbsorbPointer(
          absorbing: botonDeshabilitado,
          child: OutlineButton(
              borderSide: BorderSide(
                  width: 3, color: Colors.blue[900], style: BorderStyle.solid),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: <Widget>[
                  Text(
                    tipoActividad,
                    style: TextStyle(fontSize: 25, color: Colors.indigo[800]),
                  ),
                  Icon(
                    (kindActivity) ? Icons.adjust : Icons.album,
                    size: 25,
                    color: Colors.blue[900],
                  )
                ],
              ),
              onPressed: () {
                switch (startState) {
                  case 1:
                    //Tiempo de Focus
                    {
                      setState(() {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                      });

                      tConcentracionSeg = (widget.tConcentracion * 60);
                      Timer.periodic(Duration(seconds: 1), (t) {
                        setState(() {
                          if (tConcentracionSeg < 1 ||
                              revisarTiempoCon == true) {
                            t.cancel();
                            revisarTiempoCon = false;
                            tiempoPantalla =
                                '${widget.tConcentracion.toString()}:00';
                            botonDeshabilitado = false;
                            resetDeshabilitado = true;

                            if (tConcentracionSeg < 1) {
                              startState = 2;
                              tipoActividad = "Relax";
                              kindActivity = true;
                              tiempoPantalla =
                                  '${widget.tDescanso.toString()}:00';

                              if (contador == 4) {
                                _mostrarAlerta(context);
                                contador = 5;
                                tiempoPantalla = '${30}:00';
                              } else {
                                tiempoPantalla = '${widget.tDescanso}:00';
                              }
                            }
                          } else if (tConcentracionSeg < 60) {
                            tiempoPantalla = '$tConcentracionSeg';
                            tConcentracionSeg--;
                          } else {
                            int m = tConcentracionSeg ~/ 60;
                            int s = tConcentracionSeg - (60 * m);
                            if (s < 10) {
                              tiempoPantalla = '$m:0$s';
                            } else {
                              tiempoPantalla = '$m:$s';
                            }
                            tConcentracionSeg--;
                          }
                        });
                      });
                    }

                    break;

                  case 2:
                    {
                      setState(() {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                      });
                      tDescansoSeg = (widget.tDescanso * 60);
                      Timer.periodic(Duration(seconds: 1), (t) {
                        setState(() {
                          if (tDescansoSeg < 1 || revisarTiempoDes == true) {
                            t.cancel();
                            revisarTiempoDes = false;
                            tiempoPantalla =
                                '${widget.tConcentracion.toString()}:00';
                            botonDeshabilitado = false;
                            resetDeshabilitado = true;

                            if (tConcentracionSeg < 1) {
                              startState = 1;
                              tipoActividad = "Focus";
                              kindActivity = false;
                              tiempoPantalla =
                                  '${widget.tConcentracion.toString()}:00';
                              if (contador < 4) {
                                contador++;
                              }
                            }
                          } else if (tDescansoSeg < 60) {
                            tiempoPantalla = '$tDescansoSeg';
                            tDescansoSeg--;
                          } else {
                            int m = tDescansoSeg ~/ 60;
                            int s = tDescansoSeg - (60 * m);
                            if (s < 10) {
                              tiempoPantalla = '$m:0$s';
                            } else {
                              tiempoPantalla = '$m:$s';
                            }
                            tDescansoSeg--;
                          }
                        });
                      });
                    }

                    break;

                  case 3:
                    {
                      setState(() {
                        botonDeshabilitado = true;
                        resetDeshabilitado = false;
                      });

                      tDescansoSeg = (30 * 60);
                      Timer.periodic(Duration(seconds: 1), (t) {
                        setState(() {
                          if (tDescansoSeg < 1 || revisarTiempoDes == true) {
                            t.cancel();
                            revisarTiempoDes = false;
                            tiempoPantalla =
                                '${widget.tConcentracion.toString()}:00';
                            botonDeshabilitado = false;
                            resetDeshabilitado = true;

                            if (tConcentracionSeg < 1) {
                              startState = 1;
                              tipoActividad = "Focus";
                              kindActivity = false;
                              tiempoPantalla =
                                  '${widget.tConcentracion.toString()}:00';
                              contador = 0;
                            }
                          } else if (tDescansoSeg < 60) {
                            tiempoPantalla = '$tDescansoSeg';
                            tDescansoSeg--;
                          } else {
                            int m = tDescansoSeg ~/ 60;
                            int s = tDescansoSeg - (60 * m);
                            if (s < 10) {
                              tiempoPantalla = '$m:0$s';
                            } else {
                              tiempoPantalla = '$m:$s';
                            }
                            tDescansoSeg--;
                          }
                        });
                      });
                    }

                    break;

                  default:
                }
              }),
        ),
      ],
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Colors.teal[200],
            elevation: 25,
            title: Text(
              '\t\t Felicidades :',
              style: TextStyle(fontSize: 30, color: Colors.blue[900]),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Haz realido 5 pomodoros seguidos',
                  style: TextStyle(fontSize: 20.5, color: Colors.indigo[900]),
                ),
                Text(
                    'Te recomandamos dividir esta meta en una más pequeña para disminuir la carga',
                    style: TextStyle(fontSize: 20, color: Colors.indigo[900])),
                Text('¿Nos tomamos un descanso de 30 minutos?',
                    style: TextStyle(fontSize: 20, color: Colors.indigo[900])),
                Image.asset(
                  'assets/AlertImage.png',
                  fit: BoxFit.cover,
                  height: 170,
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Subdividir',
                    style:
                        TextStyle(fontSize: 24, color: Colors.lightBlue[800]),
                  )),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      startState = 3;
                      print('Se mando al startState 3 ');
                    });
                  },
                  child: Text(
                    'Descansar',
                    style:
                        TextStyle(fontSize: 24, color: Colors.lightBlue[700]),
                  )),
            ],
          );
        });
  }
}
