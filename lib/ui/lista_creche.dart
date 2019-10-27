import 'dart:convert';
import 'package:hackathon_facef_app/ui/dependent_register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ListaCreche extends StatefulWidget {
  String _id;

  ListaCreche(id) {
    this._id = id;
  }

  @override
  _ListaCrecheState createState() => _ListaCrecheState(_id);
}

class _ListaCrecheState extends State<ListaCreche> {
  String _id;
  List _creches = [];

  _ListaCrecheState(id) {
    this._id = id;
  }

  Future<Null> _refresh() async {
    _getCreches().then((data) {
      setState(() {
        _creches = data;
      });
    });
  }

  Future<List> _getCreches() async {
    try {
      final data = await http.get(
          'https://filadacreche.sme.prefeitura.sp.gov.br/api/v1/schools/radius/wait/-46.643394/-23.615177/4');

      if (data.statusCode == 200) {
        final response = json.decode(data.body);
        return response['results']['schools'];
      } else {
        print('deu merda');
      }
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    _getCreches().then((data) {
      setState(() {
        _creches = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de dependente'),
      ),
      body: ListView.builder(
        itemCount: _creches.length,
        itemBuilder: (context, index) {
          var distance = _creches[index]['distance'] * 1000;
          return ListTile(
            title: Text(_creches[index]['nm_exibicao_unidade_educacao']),
            subtitle:
                Text(distance.round().toString() + ' metros de distância'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DependentRegister(_creches[index], _id)));
            },
          );
        },
      ),
    );
  }
}
