import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:hackathon_facef_app/ui/responsavel_profile.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class DependentRegister extends StatefulWidget {
  String _id;
  Map<String, dynamic> _creche;

  DependentRegister(creche, id) {
    this._creche = creche;
    this._id = id;
  }

  @override
  _DependentRegisterState createState() =>
      _DependentRegisterState(_creche, _id);
}

class _DependentRegisterState extends State<DependentRegister> {
  String _id;
  Map<String, dynamic> _creche;
  String path;
  List<CameraDescription> cameras;
  CameraController controller;
  bool isReady = false;
  final _nomeController = TextEditingController();
  final _dataNascController = MaskedTextController(mask: '00/00/0000');
  final _cpfController = MaskedTextController(mask: '000.000.000-00');

  _DependentRegisterState(creche, id) {
    this._creche = creche;
    this._id = id;
  }

  @override
  void initState() {
    super.initState();
    setupCameras();
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      controller = new CameraController(cameras[0], ResolutionPreset.max);
      await controller.initialize();
    } on CameraException catch (_) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de dependente'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome completo',
                    labelStyle: TextStyle(color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira o nome!';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  controller: _dataNascController,
                  decoration: InputDecoration(
                    labelText: 'Data de nascimento',
                    labelStyle: TextStyle(color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira a data de nascimento!';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  cursorColor: Colors.blue,
                  controller: _cpfController,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    labelStyle: TextStyle(color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1)),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira o CPF!';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.black),
                ),
              ),
              RaisedButton(
                child: Icon(Icons.camera_alt),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Container(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: <Widget>[
                                    CameraPreview(controller),
                                    RaisedButton(
                                      child: Icon(Icons.camera),
                                      onPressed: () async {
                                        path = join(
                                          // Store the picture in the temp directory.
                                          // Find the temp directory using the `path_provider` plugin.
                                          (await getTemporaryDirectory()).path,
                                          '${DateTime.now()}.png',
                                        );
                                        controller.takePicture(path).then((_) {
                                          Navigator.pop(context);
                                        });
                                      },
                                    )
                                  ],
                                ),
                              )));
                },
              ),
              path != null
                  ? Container(
                      child: Image.file(
                        File(path),
                      ),
                      height: 300)
                  : Container(
                      height: 200,
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.check),
        onPressed: () async {
          var nome = _nomeController.value.text;
          var cpf = _cpfController.value.text;
          var dataNasc = _dataNascController.value.text;

          await http.post(
              'https://hackathon-facef-api.herokuapp.com/dependentes',
              body: {
                'nome': nome,
                'cpf': cpf,
                'dataNascimento': dataNasc,
                'creche': json.encode(_creche),
                'responsavel_id': _id,
              });

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResponsavelProfile(_id)));
        },
      ),
    );
  }
}
