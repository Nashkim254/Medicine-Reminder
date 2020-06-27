import'package:flutter/material.dart';
import 'package:medicine_reminder/home.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Medicine Reminder',
      theme:ThemeData(
        accentColor: Colors.greenAccent,
        primaryColor: Color(0xff00ffab),
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
    );
  }
}