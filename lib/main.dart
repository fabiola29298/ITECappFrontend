import 'package:flutter/material.dart';
import 'package:itec_app/src/pages/home_page.dart';
import 'package:itec_app/src/routes/routes.dart';

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

