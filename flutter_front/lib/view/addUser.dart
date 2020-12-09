import 'package:appturorialapi/controllers/databasehelpers.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  AddUser({Key key, this.title}) : super(key: key);
  final String title;

  @override
  AddUserState createState() => AddUserState();
}

class AddUserState extends State<AddUser> {
  DataBaseHelper databaseHelper = new DataBaseHelper();

  String msgStatus = '';

  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        databaseHelper
            .registerUserData(
                _nameController.text.trim(),
                _emailController.text.trim().toLowerCase(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (databaseHelper.status) {
            _showDialog();
            msgStatus = 'Verifique o seu email ou senha';
          } else {
            Navigator.pushReplacementNamed(context, '/dashboard');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Register user'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(
                top: 62, left: 12.0, right: 12.0, bottom: 12.0),
            children: <Widget>[
              Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite seu nome',
                    icon: new Icon(Icons.person),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite seu email',
                    icon: new Icon(Icons.email),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: new TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua Senha',
                    icon: new Icon(Icons.vpn_key),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _onPressed,
                  color: Colors.grey,
                  child: new Text(
                    'Registrar',
                    style: new TextStyle(
                        color: Colors.white, backgroundColor: Colors.grey),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new Text(
                  '$msgStatus',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 44.0),
              ),
              Container(
                height: 50,
                child: new FlatButton(
                  onPressed: () =>
                      Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new AddUser(),
                  )),
                  color: Colors.grey,
                  child: new Text(
                    'Logar',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('Erro'),
            content: new Text('Verifique seu email ou senha'),
            actions: <Widget>[
              new RaisedButton(
                child: new Text(
                  'Fechar',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
