import 'package:flutter/material.dart';
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/models/schedule_model.dart';
import 'package:itec_app/src/providers/schedule_provider.dart'; 

class ScheduleList extends StatelessWidget {
  final List<Schedule> schedule;
 //final _prefs = new PreferenciasUsuario();
 final scheduleProvider = new ScheduleProvider(); 
  ScheduleList({@required this.schedule});

  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    //final _screenSize = MediaQuery.of(context).size;

    return  Column(
           
           children: _scheduleCard(context),
         ) ;
  }

  List<Widget> _scheduleCard (BuildContext context){
    return schedule.map((schedule){ 
      Activity activity = Activity.fromJsonMap(schedule.activity);
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
             
        child:  Dismissible(
              
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: ( direccion ){
                scheduleProvider.borrarProducto(schedule.id.toString());
              },
              
              child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ 
                  ListTile(
                   
                 // contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  leading: 
                  Icon ( Icons.calendar_today, color: Colors.blue ),
                  //new Image.asset(  'assets/img/menu-img.jpg'  , fit: BoxFit.cover,  width: 120.0,
                  //  ),
                   
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
                       // _register(context, activity.id);
                  },dense: true,

                ),
                Divider()
                 
              ],
            ),
        ),
         
      );
    }).toList();
  }
/*   void _register(BuildContext context, String idActivity ) async { 
            
 
    
  }
*/
 
  
  

  
}