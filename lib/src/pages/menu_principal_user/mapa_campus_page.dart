import 'package:flutter/material.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';
class MapaCampusPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('MapaCampus Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
      );
  }
}