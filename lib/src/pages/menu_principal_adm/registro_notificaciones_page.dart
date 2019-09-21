import 'package:flutter/material.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';


class RegistroNotificacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar:AppBar(
        title: Text('Auspiciadores Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
      );
  }
}