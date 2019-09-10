import 'package:flutter/material.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';
class NotificacionesPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Notificaciones Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
      );
  }
}