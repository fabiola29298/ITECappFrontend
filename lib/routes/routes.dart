import 'package:flutter/material.dart';
import 'package:itec_app/pages/home_page.dart';

 
Map<String, WidgetBuilder> getAplicationRouter(){


  return  <String, WidgetBuilder>{
         '/'      : (BuildContext context)=> HomePage(), 
         
  };
}  