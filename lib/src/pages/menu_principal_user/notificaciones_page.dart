import 'package:flutter/material.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';

import 'package:itec_app/src/providers/activities_provider.dart'; 
import 'package:itec_app/src/providers/person_provider.dart'; 
import 'package:itec_app/src/widgets/speaker_list.dart'; 
class NotificacionesPage extends StatefulWidget {
   
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  final personProvider = new PersonProvider();
  final activitiesProvider = new ActivityProvider();
  @override
  Widget build(BuildContext context) {

    String prodData = ModalRoute.of(context).settings.arguments;
    print('ARGUMNETO: $prodData');
     
    if (prodData == 'Expositores'){
       return mostrarExpositores(context);
    }
    if (prodData == 'Auspiciadores'){
       return mostrarAuspicio(context);
    }
    if (prodData == 'Mapa del Campus'){
       return mostrarCampus(context);
    }
    if (prodData == 'Notificaciones'){
       return mostrarNotificaciones(context);
    } 
    else{
     return  mostrarExpositores(context);
    }

    
}

Widget mostrarAuspicio(BuildContext context){

  return Scaffold(
      appBar:AppBar(
        title: Text('Auspiciadores Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
      );
}

Widget mostrarCampus(BuildContext context){

  return Scaffold(
      appBar:AppBar(
        title: Text('MapaCampus Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
      );
}

Widget mostrarExpositores(BuildContext context){

  return Scaffold(
      appBar:AppBar(
        title: Text('Expositores'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      drawer: MenuWidget(),
      body: 
      CustomScrollView(
        slivers: <Widget>[ 
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox( height: 10.0),
               _obtenerActivitiesCard(context),
                
              ]
            ),
          )
        ],
      )
         
        
      );
}

Widget mostrarNotificaciones(BuildContext context){

  return Scaffold(
      appBar:AppBar(
        title: Text('Notificaciones Page'),
      ) ,
      drawer: MenuWidget(),
      body: 
        Text('data')
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
          child: Text('Expositores ITEC',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: personProvider.getSpeakers(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return SpeakerList(people: snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
    );
  } 
}