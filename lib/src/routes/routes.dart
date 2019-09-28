import 'package:flutter/material.dart';


import 'package:itec_app/src/pages/home_page.dart';
import 'package:itec_app/src/pages/menu_principal_adm/lista_asistencia_page.dart'; 
import 'package:itec_app/src/pages/menu_principal_adm/lista_participantes_page.dart';
import 'package:itec_app/src/pages/menu_principal_adm/registro_activity_page.dart';
import 'package:itec_app/src/pages/menu_principal_adm/registro_lista_control_asistencia_page.dart';
import 'package:itec_app/src/pages/menu_principal_adm/registro_notificaciones_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/activity_detalle.dart';
import 'package:itec_app/src/pages/menu_principal_user/asistencia_page.dart';  
import 'package:itec_app/src/pages/menu_principal_user/itinerario_page.dart'; 
import 'package:itec_app/src/pages/menu_principal_user/notificaciones_page.dart';
import 'package:itec_app/src/pages/menu_principal_user/programa_page.dart';
import 'package:itec_app/src/pages/pantalla_principal/log_in_page.dart';
import 'package:itec_app/src/pages/pantalla_principal/menu_page.dart';  
import 'package:itec_app/src/pages/pantalla_principal/sign_in_page.dart';
import 'package:itec_app/src/utils/utils.dart';

 
Map<String, WidgetBuilder> getAplicationRouter(){


  return  <String, WidgetBuilder>{
         '/'           : (BuildContext context)=> HomePage(),
         'scroll'     : (BuildContext context){
                          cerrarSesion();
                          return HomePage();
                          } , 
         'login'            : (BuildContext context)=> LoginPage(),
         'signin'           : (BuildContext context)=> SignInPage(),
         'menuPage'           : (BuildContext context)=> MenuPage(),
         //USER Navigator.pushNamed(context, 'producto', arguments: producto )
         'asistenciaUser'        : (BuildContext context)=> AsistenciaPage(), 
         'itinerarioUser'        : (BuildContext context)=> ItinerarioPage(), 
         'notificacionesUser'    : (BuildContext context)=> NotificacionesPage(),
         'programaUser'          : (BuildContext context)=> ProgramaPage(),
          'activityDetalle'      : (BuildContext context)=> ActivityDetallerPage(),
         //ADMIN  
         'registroActivityAdmin'          : (BuildContext context)=> RegistroActivityPage(),
         'listaParticipantes'             : (BuildContext context)=> ListaParticipantesPage(),
         
         'listaAsistenciaAdmin'           : (BuildContext context)=> ListaAsistenciaPage(),
         'listaControlAdmin'              : (BuildContext context)=> RegistroListaControlAsistenciaPage(),
         
         'registroControlAdmin'           : (BuildContext context)=> RegistroListaControlAsistenciaPage(),
         'registroNotificacionesAdmin'    : (BuildContext context)=> RegistroNotificacionesPage()
  };
}  