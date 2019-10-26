import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:hackathon_facef_app/ui/responsavel_register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginController = MaskedTextController(mask: '000.000.000-00');
  final _passwordController = TextEditingController();

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
          padding: const EdgeInsets.all(16),
          child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 128),
                    child: Image.network(
                      'http://legacy.unifacef.com.br/novo/logo/LOGO_Uni-FACEF.png'
                    ),
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
                    child: RaisedButton(
                      child: Text("ENTRAR"),
                      color: Colors.orange,
                      onPressed: () {
                        print("logou");
                      },
                    ),
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
