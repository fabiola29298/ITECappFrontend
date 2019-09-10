import 'package:flutter/material.dart';
import 'package:itec_app/src/models/activity_model.dart';

class ActivitiesList extends StatelessWidget {
  final List<Activity> activities;

  ActivitiesList({@required this.activities});

  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    //final _screenSize = MediaQuery.of(context).size;

    return  Column(
           
           children: _activitiesCard(),
         ) ;
  }

  List<Widget> _activitiesCard (){
    return activities.map((activity){
      return Container(
        margin: EdgeInsets.all( 10.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10.0, // has the effect of softening the shadow
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
                    SizedBox(height: 10.0),
                    Text(
                      'Fecha: 28/09/2019    \n Hora: 14:00 - 16:00  ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Tipo: ${activity.type}',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                    Text(
                      'Expositor: Pesona Prueba',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                    Text(
                      'Lugar: Aula ${activity.classroom} Bloque ${activity.blockCampus} ',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ), 
                     ]), 
                onTap: () { /* react to the tile being tapped */ },dense: true,

              ),
              Divider()
               
            ],
          ),
         
      );
    }).toList();
  }

  
  

  
}