import 'package:flutter/material.dart';  
import 'dart:io';
import 'package:itec_app/src/models/person_model.dart';
import 'package:itec_app/src/providers/control_provider.dart'; 

class ParticipantsList extends StatelessWidget {
  final List<Person> people; 
  File foto;
 final controlProvider = new ControlProvider(); 
  ParticipantsList({@required this.people});

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
              SizedBox(height: 10.0,),
                ListTile(
                 
               // contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                leading: 
                Icon ( Icons.person, color: Colors.blue ),
                //new Image.asset(  'assets/img/menu-img.jpg'  , fit: BoxFit.cover,  width: 120.0,
                //  ),
                
                title: Text(
                  '${person.name} ${person.lastName}',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Text(
                      'Correo: ${person.email}       ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(height: 5.0),  
                    SizedBox(height: 5.0),
                    Text(
                      'Tipo de Inscripciones: ${person.typeInscription} \n Tipo de usuario:${person.role}',
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
   
}