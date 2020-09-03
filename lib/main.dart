import 'package:flutter/material.dart';
import 'package:aquadoroo/goals_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        'goalsPage' : (BuildContext context) =>GoalsPage(),
      },
      initialRoute: 'goalsPage',
    );
  }
}