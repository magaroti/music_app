import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:async/async.dart';
import 'package:path_provider/path_provider.dart';

class HomePageMusic extends StatefulWidget {
  @override
  _HomePageMusicState createState() => _HomePageMusicState();
}

class _HomePageMusicState extends State<HomePageMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            width: 330,
            height: 350,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(.7),
                    shape: BoxShape.circle,
                  ),
                ),
                Center(
                  child: Container(
                    child: Text(
                      "Música",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50, top: 50),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.fast_rewind,size: 70,),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.play_circle_filled,
                      size: 80,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.fast_forward,size: 80,),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            ),
        ],
      ),
    );
  }
}

class ListMusic extends StatefulWidget {
  @override
  _ListMusicState createState() => _ListMusicState();
}

class _ListMusicState extends State<ListMusic> {

  List _toDolist = [];



// Funçao para Obter o Arquivo jSon
 Future<File> _getFile() async{
   final diretorio = await getApplicationDocumentsDirectory();
   return File("${diretorio.path}/data.json");
 }

 // Funçao Para Salvar um Dado no Arquivo
 Future<File> _saveData() async{
  String data = json.encode(_toDolist);
  final file = await _getFile();
  return file.writeAsString(data);
 }

 // Para ler os dados no arquivos
 Future<String> _readData() async{
   try{
     final file = await _getFile();

     return file.readAsString();
   }catch (e) {
     return null;

   }

 }


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

    );
  }


}






class FolderMusic extends StatefulWidget {
  @override
  _FolderMusicState createState() => _FolderMusicState();
}

class _FolderMusicState extends State<FolderMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
