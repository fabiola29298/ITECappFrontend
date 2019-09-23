import 'package:flutter/material.dart';
import 'package:itec_app/src/models/assist_control_model.dart';
 import 'package:itec_app/src/widgets/menu_widget.dart';
class ListaAsistenciaPage extends StatefulWidget {
  @override
  _ListaAsistenciaPageState createState() => _ListaAsistenciaPageState();
}

class _ListaAsistenciaPageState extends State<ListaAsistenciaPage> {
  @override
  Widget build(BuildContext context) {

    Control prodData = ModalRoute.of(context).settings.arguments;
    


      return Scaffold(
      appBar:AppBar(
        title: Text('Auspiciadores Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data $prodData')
      );
  }
}