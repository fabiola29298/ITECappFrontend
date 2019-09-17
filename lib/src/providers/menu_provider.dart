import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

class _MenuProvider {

  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
  final _prefs = new PreferenciasUsuario(); 
  String user='';
    
    if(_prefs.typeUSer=='ADMIN_ROLE')
      { user='data/menu_routes_dev.json'; }
    else{ user='data/menu_routes.json';  }
    
    final resp = await rootBundle.loadString(user);
    Map dataMap = json.decode( resp );
    opciones = dataMap['rutas'];
    
      
    return opciones;
  }

}


final menuProvider = new _MenuProvider(); 