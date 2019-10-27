import 'dart:convert';
import 'package:hackathon_facef_app/ui/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ResponsavelRegister extends StatefulWidget {
  @override
  _ResponsavelRegisterState createState() => _ResponsavelRegisterState();
}

class _ResponsavelRegisterState extends State<ResponsavelRegister> {

  final _nomeController = TextEditingController();
  final _cpfController = MaskedTextController(mask: '000.000.000-00');
  final _telefoneController = MaskedTextController(mask: '(00) 00000-0000');
  final _cepController = MaskedTextController(mask: '00000-000');
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Future _saveCliente() async {
    var nome = _nomeController.value.text;
    var telefone = _telefoneController.value.text;
    var email = _emailController.value.text;
    var cpf = _cpfController.value.text;
    var cep = _cepController.value.text;
    var password = _passwordController.value.text;

    var response = await http.post(
        'https://hackathon-facef-api.herokuapp.com/responsaveis',
        body: {
          'nome': nome,
          'telefone': telefone,
          'email': email,
          'cpf': cpf,
          'cep': cep,
          'senha': password
        }
    );

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome completo',
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
                        return 'Insira o nome!';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    controller: _cpfController,
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
                    keyboardType: TextInputType.url,
                    cursorColor: Colors.white,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
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
                        return 'Insira o e-mail!';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    controller: _telefoneController,
                    decoration: InputDecoration(
                      labelText: 'Telefone',
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
                        return 'Insira o telefone!';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    controller: _cepController,
                    decoration: InputDecoration(
                      labelText: 'CEP',
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
                        return 'Insira o CEP!';
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.check, color: Colors.white,),
        onPressed: () {
          _saveCliente().then((res) {
            if (res['id'] != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Login()
                )
              );
            }
          });
        },
      ),
    );
  }
}