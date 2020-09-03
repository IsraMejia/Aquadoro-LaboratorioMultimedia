import 'package:flutter/material.dart';
import 'package:aquadoroo/goals_page.dart';
import 'package:aquadoroo/aquadoro.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'goalsPage' : (BuildContext context) =>GoalsPage(),
        'aquadoro' : (BuildContext context) =>Aquadoro(),
      },
      initialRoute: 'goalsPage',
    );
  }
}