import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hackathon_facef_app/ui/responsavel_profile.dart';
import 'package:hackathon_facef_app/ui/responsavel_register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginController = MaskedTextController(mask: '000.000.000-00');
  final _passwordController = TextEditingController();

  Future _login() async {
    var login = _loginController.value.text;
    var password = _passwordController.value.text;

    var response = await http.get(
      'https://hackathon-facef-api.herokuapp.com/responsaveis?cpf=$login&senha=$password'
    );

    return json.decode(response.body);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(0, 108, 233, 1), Colors.lightBlue[300], Color.fromRGBO(0, 108, 233, 1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [.1, .35, .8]
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 64),
                    child: Image.asset('assets/logo.png', scale: 2.5,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TextFormField(
                      cursorColor: Colors.white,
                      controller: _loginController,
                      decoration: InputDecoration(
                        labelText: 'CPF',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1
                          )
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1
                          )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1
                          )
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira o CPF!';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      obscureText: true,
                      cursorColor: Colors.white,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1
                          )
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1
                          )
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 1
                          )
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Insira a senha!';
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Builder(
                      builder: (context) => RaisedButton(
                      child: Text("ENTRAR", style: TextStyle(color: Colors.white),),
                      color: Color.fromRGBO(251, 89, 59, 1),
                      onPressed: () {
                        _login().then((res) {
                          if (res.length == 0) {
                            final snack = SnackBar(
                              content: Text('CPF e/ou senha incorreto(s)!'),
                              duration: Duration(seconds: 3),
                            );
                            Scaffold.of(context).showSnackBar(snack);
                          } else {
                            var id = res[0]['id'];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResponsavelProfile(id.toString())
                              )
                            );
                          }
                        });
                      },
                    ),
                    )
                  ),
                  FlatButton(
                    child: Text(
                      'Não possui cadastro? Clique aqui para se cadastrar.', 
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResponsavelRegister()
                        )
                      );
                    },
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
