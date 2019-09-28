import 'package:flutter/material.dart';
import 'package:itec_app/src/providers/push_notifications_provider.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';


class RegistroNotificacionesPage extends StatefulWidget {
  @override
  _RegistroNotificacionesPageState createState() => _RegistroNotificacionesPageState();
}

class _RegistroNotificacionesPageState extends State<RegistroNotificacionesPage> {
  
  
  
  
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