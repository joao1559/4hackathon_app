import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ResponsavelRegister extends StatefulWidget {
  @override
  _ResponsavelRegisterState createState() => _ResponsavelRegisterState();
}

class _ResponsavelRegisterState extends State<ResponsavelRegister> {

  final _nomeController = TextEditingController();
  final _cpfController = MaskedTextController(mask: '000.000.000-00');
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.check, color: Colors.white,),
        onPressed: () {
          print('salvou');
        },
      ),
    );
  }
}