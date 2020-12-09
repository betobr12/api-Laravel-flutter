import 'dart:convert';

import 'package:appturorialapi/view/addProduct.dart';
import 'package:appturorialapi/view/addUser.dart';
import 'package:appturorialapi/view/listProducts.dart';
import 'package:appturorialapi/view/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gerenciador de Produtos",
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData(
        accentColor: Colors.white70
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Produtos Flutter", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
            },
            child: Text("Sair", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Center(child:ListProducts(),
      //Text("Main Page")
      ),
      drawer: Drawer(
        child: new ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                  accountName: new Text('Sistema Produtos'),
                  accountEmail: new Text('betobr08@gmail.com'),
                   decoration: new BoxDecoration(
                     color: Colors.black87,
                   ),
                ),
               new ListTile(
                  title: new Text("Lista de Produtos"),
                  trailing: new Icon(Icons.description),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => ListProducts(),
                  )),
                ),
                new ListTile(
                  title: new Text("Adicionar Produtos"),
                  trailing: new Icon(Icons.add_circle_outline),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AddDataProduct(),
                  )),
                ),
                 new Divider(),
                new ListTile(
                  title: new Text("Registrar Usuarios"),
                  trailing: new Icon(Icons.fitness_center),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => AddUser(),
                  )),
                ),
              ],
            ),
      ),
    );
  }
}
