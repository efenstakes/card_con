import 'package:flutter/material.dart';


void main()=> runApp(MyApp());



class MyApp extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(

        appBar: AppBar( title: Text('Contacts'), ),

        body: Center(
          child: Text('My Contact List'),
        ),

      ),

    );
  }// Widget build(BuildContext context) { .. }

}