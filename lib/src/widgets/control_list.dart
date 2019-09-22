import 'package:flutter/material.dart';
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/models/assist_control_model.dart';
import 'package:itec_app/src/models/person_model.dart'; 
import 'package:itec_app/src/providers/control_provider.dart'; 

class ControlList extends StatelessWidget {
  final List<Control> control;
 //final _prefs = new PreferenciasUsuario();
 final controlProvider = new ControlProvider(); 
  ControlList({@required this.control});

  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    //final _screenSize = MediaQuery.of(context).size;

    return  Column(
           
           children: _controlCard(context),
         ) ;
  }

  List<Widget> _controlCard (BuildContext context){
    return control.map((control){ 
      Activity activity = Activity.fromJsonMap(control.activity);
      Person   person = Person.fromJsonMap(control.person);

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
                Icon ( Icons.indeterminate_check_box, color: Colors.blue ),
                //new Image.asset(  'assets/img/menu-img.jpg'  , fit: BoxFit.cover,  width: 120.0,
                //  ),
                 
                title: Text(
                  '${activity.name}', //nombre de actividad
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
                      'Lugar: Aula ${activity.classroom} ',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ), 
                    SizedBox(height: 5.0),
                    
                    Text(
                      'Encargado: ${person.name} ${person.lastName}',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                     ]), 
                onTap: () { /* react to the tile being tapped */ 
                      
                     // print('ID activity: ${activity.id}');
                     // print('ID person  : ${_prefs.idpref}');
                     // _register(context, activity.id);
                },dense: true,

              ),
              Divider()
               
            ],
          ),
         
      );
    }).toList();
  }
/*   void _register(BuildContext context, String idActivity ) async { 
            
 
    
  }
*/
 
  
  

  
}