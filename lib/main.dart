import 'package:flutter/material.dart';
import 'package:card_con/screens/home.dart';


void main()=> runApp(MyApp());



class MyApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Home(),

    );
  }// Widget build(BuildContext context) { .. }

}