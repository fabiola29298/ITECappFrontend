import 'package:flutter/material.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:itec_app/src/providers/assist_provider.dart'; 
import 'package:itec_app/src/widgets/assist_user_list.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';
class AsistenciaPage extends StatelessWidget {
   final assistProvider = new AssistProvider();
   final prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Lista de asistencia'),
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


  Widget _obtenerActivitiesCard(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text('Lista de asistencia de cada actividad \nAl terminar la actividad debe enviar su comentario',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: assistProvider.buscarAssistbyPerson(prefs.idpref), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return AssistUserList(assist: snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
    );
  } 

}