import 'package:flutter/material.dart';
import 'package:aquadoroo/goals_page.dart';
import 'package:aquadoroo/aquadoro.dart';
import 'package:aquadoroo/pantalla_carga.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'pantallaCarga': (BuildContext context) => PantallaDeCarga(),
        'goalsPage': (BuildContext context) => GoalsPage(),
        'aquadoro': (BuildContext context) => Aquadoro(),
      },
      initialRoute: 'pantallaCarga',
    );
  }
}
