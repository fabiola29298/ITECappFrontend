import 'package:flutter/material.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/providers/schedule_provider.dart';
//import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:itec_app/src/utils/utils.dart';

class ActivitiesList extends StatelessWidget {
  final List<Activity> activities;
 //final _prefs = new PreferenciasUsuario();
 final scheduleProvider = new ScheduleProvider(); 
 //final scaffoldKey = GlobalKey<ScaffoldState>();
  ActivitiesList({@required this.activities});
final _prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    //final _screenSize = MediaQuery.of(context).size;

    return  Column(
           
           children: _activitiesCard(context),
         ) ;
  }

  List<Widget> _activitiesCard (BuildContext context){
    return activities.map((activity){
      return Container(
        margin: EdgeInsets.all( 10.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 3.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow
              offset: Offset(
                10.0, // horizontal, move right 10
                10.0, // vertical, move down 10
              ),
            )
          ]),
             
        child:  Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ 
                ListTile(
                 
               // contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                leading: 
                Icon ( Icons.calendar_today, color: Colors.blue ),
                //new Image.asset(  'assets/img/menu-img.jpg'  , fit: BoxFit.cover,  width: 120.0,
                //  ),
                trailing: Column(
                  children: <Widget>[
                    Icon ( Icons.add, color: Colors.blue ),
                    Text(
                      'Agregar',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                  ],
                ),
                title: Text(
                  activity.name,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Text(
                      'Fecha: ${activity.date}    \nHora: ${activity.startTime}  ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Tipo: ${activity.type}',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                    Text(
                      'Expositor: Pesona Prueba',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                    Text(
                      'Lugar: Aula ${activity.classroom} ',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ), 
                    SizedBox(height: 5.0),
                    Text(
                      'Descripcion: ${activity.description} ',
                      style: new TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, )
                    ),
                     ]), 
                onTap: () { /* react to the tile being tapped */ 
                      
                     // print('ID activity: ${activity.id}');
                     // print('ID person  : ${_prefs.idpref}');
                     if(_prefs.token ==''||_prefs.token ==null)
                     {
                       mostrarAlerta(context, 'Debe registrarse para agregarlo a su itinerario');
                     }
                     else{
                       _register(context, activity.id);
                     }
                      
                     //mostrarSnackbar( 'Guardado');
                     //mostrarGuardado(context, 'Se guardo con exito. Lo puede ver en su itinerario');
                },dense: true,

              ),
              Divider()
               
            ],
          ),
         
      );
    }).toList();
  }
  Future<bool> _register(BuildContext context, String idActivity ) async { 
    mostrarCargando(context, 'Agregando a su itinerario');        
    Map info = await scheduleProvider.nuevoSchedule(idActivity );
    
    if ( info['ok'] ) {
      
      Navigator.of(context).pop();
      //Navigator.pushReplacementNamed(context, 'itinerarioUser');
      return true;
    } else {
      Navigator.of(context).pop();
      mostrarAlerta( context, info['mensaje'] );
      return false;
    }
    
  }
  
 
  
  

  
}