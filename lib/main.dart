import 'package:flutter/material.dart';
import 'package:hackathon_facef_app/ui/login.dart';

void main() {
  runApp(MaterialApp(
      title: 'Hackathon Facef',
      home: Login(),
      theme: ThemeData(
        primaryColor: Colors.blue, accentColor: Colors.amberAccent
      )
    ));
}
