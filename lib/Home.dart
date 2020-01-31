import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/home_page.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  var _listaPaginas = [HomePageMusic(), ListMusic(), FolderMusic()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void portraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Música', style: TextStyle(fontFamily: "Nexa"),),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("Configurações"),
                ),
                PopupMenuItem(
                  child: Text("Adicionar Música"),
                )
              ];
            },
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.library_music),
            title: Text('Music'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.redAccent,
            icon: Icon(Icons.folder),
            title: Text('Pasta'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );

  }

  _buildBody() {
    return SafeArea(
      child: _listaPaginas[_selectedIndex],
    );
  }
}
