import 'package:flutter/material.dart';

import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/providers/activities_provider.dart';
import 'package:itec_app/src/widgets/activities_list.dart'; 
class ProgramaPage extends StatelessWidget {

   
  final activitiesProvider = new ActivitiesProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Programa Page'),
      ),
      body: _obtenerActivitiesCard(context),
         
        
      );
  }
  Widget _obtenerActivitiesCard(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text('Programa de ITEC', style: Theme.of(context).textTheme.subhead)),
        SizedBox(height: 5.0,),
          FutureBuilder(
           future: activitiesProvider.getActivities(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
             //snapshot.data.forEach((p)=> print(p.name));
             if(snapshot.hasData){
               return ActivitiesList(activities: snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
    );
  }
  Widget _obtenerActivities() { 

    return FutureBuilder(
      future: activitiesProvider.getActivities(), 
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
      //  if(snapshot.hasData){
          return ListView(
          children: _crearActivitiesPageView(snapshot.data , context),
          );
      //  }
      //  else{
       //   return Center(child: CircularProgressIndicator());
      //  }
      },
    );

  }
List<Widget> _crearActivitiesPageView( List<Activity> activities, BuildContext context ) {
     print('title $activities');
    final List<Widget> opciones = [];
 
    
    activities.map( (activity) {
      print('title $activity.name');
      final widgetTemp = ListTile(
        title: Text( activity.name ),
        subtitle: Text(activity.description),
        leading:  Icon(Icons.ac_unit)   ,
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {

          
        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;
    
  }
   
}