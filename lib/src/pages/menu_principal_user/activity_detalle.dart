import 'package:flutter/material.dart';
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/models/schedule_model.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

 
import 'package:itec_app/src/providers/activities_provider.dart';
import 'package:itec_app/src/search/search_activity_nombre.dart';
import 'package:itec_app/src/utils/utils.dart';
import 'package:itec_app/src/widgets/activities_list.dart';
import 'package:itec_app/src/widgets/menu_widget.dart'; 
class ActivityDetallerPage extends StatelessWidget {
  final scheduleProvider = new Schedule();  
  final activitiesProvider = new ActivityProvider();
  @override
  Widget build(BuildContext context) {

    final Activity activity = ModalRoute.of(context).settings.arguments;
     final _prefs = new PreferenciasUsuario();
    return Scaffold(
      appBar:AppBar(
        title: Text('Programa ITEC'),
         
      ),
      drawer: MenuWidget(),
      body: 
      CustomScrollView(
        slivers: <Widget>[ 
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0),
                Column(
                  children: <Widget>[
                    ListTile(
                 
               // contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                leading: 
                Icon ( Icons.calendar_today, color: Colors.blue ),
                 
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
                      'Lugar: Aula ${activity.classroom} ',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ), 
                    SizedBox(height: 5.0),
                    Text(
                      'Descripcion: ${activity.description} ',
                      style: new TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, )
                    ),
                     ]), 
                onTap: () {  
                },dense: true,

              ),
              Divider()
                  ],
                )
                
              ]
            ),
          )
        ],
      )
         
        
      );
  }
  Widget _obtenerActivitiesCard(BuildContext context, List<Activity> activitiesData){
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text('Clic en la actividad para agregar a su itinerarior personalizado',
                style: TextStyle(color: Colors.black , fontSize: 15.0),
                )),
          SizedBox(height: 5.0),
           
         ActivitiesList(activities: activitiesData),
               
      ],),
    );
  } 
 
}