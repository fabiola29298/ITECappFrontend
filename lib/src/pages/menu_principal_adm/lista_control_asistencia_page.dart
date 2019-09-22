import 'package:flutter/material.dart';
import 'package:itec_app/src/providers/control_provider.dart';
import 'package:itec_app/src/widgets/control_list.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';


class ListaControlAsistenciaPage extends StatelessWidget {

  final controlProvider = new ControlProvider(); 
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar:AppBar(
        title: Text('Lista de control de asistencia'),
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
               _obtenerControlCard(context),
                
              ]
            ),
          )
        ],
      )
         
        
      );
  }



  Widget _obtenerControlCard(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text('Listas de control de asistencias de participantes ',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: controlProvider.getControls(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return ControlList(control: snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
    );
  } 
}