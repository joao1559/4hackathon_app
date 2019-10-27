// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';

// class DependenteProfile extends StatefulWidget {
//   String _id;

//   DependenteProfile(id) {
//     this._id = id;
//   }

//   @override
//   _DependenteProfileState createState() => _DependenteProfileState(_id);
// }

// class _DependenteProfileState extends State<DependenteProfile> {
//   String _id;
//   bool _isLoading = true;
//   Map<String, dynamic> _responsavel;

//   _DependenteProfileState(id) {
//     this._id = id;
//   }

//   @override
//   void initState() {
//     _getDependentes().then((data) {
//       setState(() {
//         if (data.length > 0) {
//           _responsavel = data[0];
//           _isLoading = false;
//         }
//       });
//     });
//   }

//   Future _getDependentes() async {
//     http.Response response = await http
//         .get('https://hackathon-facef-api.herokuapp.com/dependentes?id=$_id');
//     return json.decode(response.body);
//   }

//   int _generateRandom() {
//     var random = new Random();
//     return random.nextInt(3);
//   }

//   @override
//   Widget build(BuildContext ctx) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: ,
//         title: Text('Perfil do Dependente'),
//       ),
//       body: _isLoading
//           ? Container()
//           : Container(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 children: <Widget>[
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 16),
//                       child: Text(
//                         _responsavel['nome'],
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Text(
//                         _responsavel['cpf'],
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Text(
//                         _responsavel['telefone'],
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 16, bottom: 16),
//                     child: Divider(),
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Dependentes',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: FutureBuilder(
//                         future: _getDependentes(),
//                         builder: (context, snapshot) {
//                           switch (snapshot.connectionState) {
//                             case ConnectionState.waiting:
//                             case ConnectionState.none:
//                               return Container(
//                                 width: 200.0,
//                                 height: 200.0,
//                                 alignment: Alignment.center,
//                               );
//                             default:
//                               if (snapshot.hasError)
//                                 return Container();
//                               else
//                                 return _createGrid(context, snapshot);
//                           }
//                         }),
//                   )
//                 ],
//               ),
//             ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }

//   Widget _createGrid(BuildContext context, AsyncSnapshot snapshot) {
//     return snapshot.data.length == 0
//         ? ListTile(
//             title: Text('Nenhum dependente cadastrado...'),
//           )
//         : ListView.builder(
//             itemCount: snapshot.data.length,
//             itemBuilder: (BuildContext ctx, int index) {
//               return ListTile(
//                 leading: CircleAvatar(
//                   radius: 30.0,
//                   backgroundImage: NetworkImage(imagens[_generateRandom()]),
//                   backgroundColor: Colors.transparent,
//                 ),
//                 title: Text(snapshot.data[index]['nome']),
//                 subtitle: Text(
//                   snapshot.data[index]['cpf'],
//                   style: TextStyle(
//                       height: 1,
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).primaryColor),
//                 ),
//                 onTap: () {},
//               );
//             },
//           );
//   }
// }
