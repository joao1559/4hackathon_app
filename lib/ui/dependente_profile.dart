import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';

class DependenteProfile extends StatefulWidget {
  String _id;

  DependenteProfile(id) {
    this._id = id;
  }

  @override
  _DependenteProfileState createState() => _DependenteProfileState(_id);
}

class _DependenteProfileState extends State<DependenteProfile> {
  String _id;
  bool _isLoading = true;
  Map<String, dynamic> _dependente;
  Map<String, dynamic> _creche;

  _DependenteProfileState(id) {
    this._id = id;
  }

  @override
  void initState() {
    _getDependentes().then((data) {
      setState(() {
        if (data.length > 0) {
          _dependente = data[0];
          _creche = json.decode(_dependente['creche']);
          print(_creche);
          _isLoading = false;
        }
      });
    });
  }

  Future _getDependentes() async {
    http.Response response = await http
        .get('https://hackathon-facef-api.herokuapp.com/dependentes?id=$_id');
    return json.decode(response.body);
  }

  int _generateRandom() {
    var random = new Random();
    return random.nextInt(3);
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Dependente'),
      ),
      body: _isLoading
          ? Container()
          : Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                          'https://imageserve.babycenter.com/16/000/416/R123DdZ0d94B1pb6AacEiJk7HFF843Br_med.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        _dependente['nome'],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _dependente['cpf'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _dependente['dataNascimento'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Divider(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Instituição',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _creche['nm_exibicao_unidade_educacao'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _creche['endereco_completo'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        _creche['cd_unidade_educacao'],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Divider(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Notificações',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Cadastro Concluído!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(
                            'O cadastro do dependente foi realizado com sucesso.',
                            style: TextStyle(
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Cadastro Concluído!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(
                            'O cadastro do dependente foi realizado com sucesso.',
                            style: TextStyle(
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Cadastro Concluído!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(
                            'O cadastro do dependente foi realizado com sucesso.',
                            style: TextStyle(
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Cadastro Concluído!',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          subtitle: Text(
                            'O cadastro do dependente foi realizado com sucesso.',
                            style: TextStyle(
                              height: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _createGrid(BuildContext context, AsyncSnapshot snapshot) {
    return snapshot.data.length == 0
        ? ListTile(
            title: Text('Nenhum dependente cadastrado...'),
          )
        : ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext ctx, int index) {
              return ListTile(
                title: Text(snapshot.data[index]['nome']),
                subtitle: Text(
                  snapshot.data[index]['cpf'],
                  style: TextStyle(
                      height: 1,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                onTap: () {},
              );
            },
          );
  }
}
