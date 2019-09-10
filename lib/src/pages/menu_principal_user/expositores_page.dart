import 'package:flutter/material.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';
class ExpositoresPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Expositores Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
      );
  }
}