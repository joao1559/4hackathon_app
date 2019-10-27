import 'package:flutter/material.dart';
// import 'package:hackathon_facef_app/ui/login.dart';
import 'package:hackathon_facef_app/ui/responsavel_profile.dart';

void main() {
  runApp(MaterialApp(
      title: 'Hackathon Facef',
      home: ResponsavelProfile('1'),
      theme: ThemeData(
          primaryColor: Colors.blue, accentColor: Colors.amberAccent)));
}
