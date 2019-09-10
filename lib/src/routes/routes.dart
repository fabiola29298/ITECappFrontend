import 'package:flutter/material.dart';


import 'package:itec_app/src/pages/home_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/asistencia_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/auspiciador_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/expositores_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/itinerario_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/mapa_campus_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/notificaciones_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/programa_page.dart';
import 'package:itec_app/src/pages/pantalla_principal/log_in_page.dart';
import 'package:itec_app/src/pages/pantalla_principal/scroll_page.dart';
import 'package:itec_app/src/pages/pantalla_principal/sign_in_page.dart';

 
Map<String, WidgetBuilder> getAplicationRouter(){


  return  <String, WidgetBuilder>{
         '/'      : (BuildContext context)=> HomePage(),
         'scroll ': (BuildContext context)=> ScrollPage(),
         'login'            : (BuildContext context)=> LoginPage(),
         'signin'           : (BuildContext context)=> SignInPage(),
         'asistenciaUser'        : (BuildContext context)=> AsistenciaPage(),
         'expositoresUser'       : (BuildContext context)=> ExpositoresPage(),
         'auspiciadorUser'       : (BuildContext context)=> AuspiciadorPage(),
         'itinerarioUser'        : (BuildContext context)=> ItinerarioPage(),
         'mapaUser'              : (BuildContext context)=> MapaCampusPage(),
         'notificacionesUser'    : (BuildContext context)=> NotificacionesPage(),
         'programaUser'          : (BuildContext context)=> ProgramaPage()  
         
  };
}  