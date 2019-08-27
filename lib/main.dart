import 'package:flutter/material.dart';
import 'package:itec_app/pages/home_page.dart';
import 'package:itec_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'itec APP',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
       routes: getAplicationRouter(),
       onGenerateRoute: (setting){
         return MaterialPageRoute(builder: (context)=>HomePage());
       },
    );
  }
}

