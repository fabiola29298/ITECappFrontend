import 'package:flutter/material.dart';  
import 'dart:io';
import 'package:itec_app/src/models/person_model.dart';
import 'package:itec_app/src/providers/schedule_provider.dart'; 

class SpeakerList extends StatelessWidget {
  final List<Person> people; 
  File foto;
 final scheduleProvider = new ScheduleProvider(); 
  SpeakerList({@required this.people});

  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    //final _screenSize = MediaQuery.of(context).size;

    return  Column(
           
           children: _peopleCard(context),
         ) ;
  }

  List<Widget> _peopleCard (BuildContext context){
    return people.map((person){
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
              _mostrarFoto(person.urlImage),
                ListTile(
                 
               // contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                leading: 
                Icon ( Icons.person, color: Colors.blue ),
                //new Image.asset(  'assets/img/menu-img.jpg'  , fit: BoxFit.cover,  width: 120.0,
                //  ),
                
                title: Text(
                  person.name,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Text(
                      'Carrera: ${person.career}    \nEspecialidad: ${person.degree}  ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(height: 5.0),  
                    SizedBox(height: 5.0),
                    Text(
                      'Descripcion: ${person.description} ',
                      style: new TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, )
                    ),
                     ]), 
                onTap: () { /* react to the tile being tapped */ 
                       
                },dense: true,

              ),
              Divider()
               
            ],
          ),
         
      );
    }).toList();
  } 
  
  Widget _mostrarFoto(String url) {

    if ( url != null ) {
      
      return FadeInImage(
        
        image: NetworkImage( url ),
        placeholder: AssetImage('assets/img/jar-loading.gif'),
        height: 150.0,
        fit: BoxFit.contain,
      );

    } else {

      return Image(

        image: AssetImage('assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,

      );

    }

  }
}