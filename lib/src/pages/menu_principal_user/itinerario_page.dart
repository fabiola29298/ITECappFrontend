import 'package:flutter/material.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:itec_app/src/providers/schedule_provider.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';
import 'package:itec_app/src/widgets/schedule_list.dart';
 class ItinerarioPage extends StatelessWidget {

   
  final scheduleProvider = new ScheduleProvider();
  final _prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {

    if  (_prefs.token==null || _prefs.token=='' ){
      return  Scaffold(
      appBar:AppBar( title: Text('Itinerario') ),
      drawer: MenuWidget(),
      body: CustomScrollView(
        slivers: <Widget>[ 
          SliverList(
            delegate: SliverChildListDelegate(
              [ Text('Debe registrarse para crear su itinerario personalizado') ]
            ))]
      ) );
    }
    else{

    
    return Scaffold(
      appBar:AppBar(
        title: Text('Itinerario'),
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
               _obtenerScheduleCard(context),
                
              ]
            ),
          )
        ],
      )
         
        
      );

      }
  }
  Widget _obtenerScheduleCard(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text('Mi itinerario personalizado \nDesliza a la derecha para eliminar',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: scheduleProvider.getSchedules(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               print('hay algo ');
               return ScheduleList(schedule: snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
    );
  } 
 }