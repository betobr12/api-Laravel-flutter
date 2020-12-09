
import 'package:appturorialapi/controllers/databasehelpers.dart';
import 'package:appturorialapi/main.dart';
import 'package:flutter/material.dart';


class AddDataProduct extends StatefulWidget {

  AddDataProduct({Key key , this.title}) : super(key : key);
  final String title;


  @override
  _AddDataProductState createState() => _AddDataProductState();
}

class _AddDataProductState extends State<AddDataProduct> {

   DataBaseHelper databaseHelper = new DataBaseHelper();


  final TextEditingController _nameController = new TextEditingController();  
  final TextEditingController _priceController = new TextEditingController();
  final TextEditingController _stockController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Adicionar Produto',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:  Text('Add Produto'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
            children: <Widget>[
              
              Container(
                height: 50,
                child: new TextField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'produto',
                    hintText: 'Nome do Produto',
                    icon: new Icon(Icons.computer),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: new TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'valor',
                    hintText: 'Digite um valor',
                    icon: new Icon(Icons.monetization_on),
                  ),
                ),
              ),
              
              new Padding(padding: new EdgeInsets.only(top: 44.0),),

              Container(
                height: 50,
                child: new TextField(
                  controller: _stockController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'estoque',
                    hintText: 'Digite uma quantidade',
                    icon: new Icon(Icons.add_circle),
                  ),
                ),
              ),
             new Padding(padding: new EdgeInsets.only(top: 44.0),),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: (){
                    databaseHelper.addDataProducto(
                        _nameController.text.trim(), _priceController.text.trim(), _stockController.text.trim());
                    Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) => new MainPage(),
                        )
                    );
                  },
                  color: Colors.grey,
                  child: new Text(
                    'Adicionar',
                    style: new TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.grey),),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }



}
