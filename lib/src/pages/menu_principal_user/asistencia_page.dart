import 'package:flutter/material.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';
class AsistenciaPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Asistencia Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
      );
  }
}