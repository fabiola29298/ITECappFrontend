import 'package:flutter/material.dart';
 
import 'package:itec_app/src/providers/activities_provider.dart';
import 'package:itec_app/src/widgets/activities_list.dart';
import 'package:itec_app/src/widgets/menu_widget.dart'; 
class ProgramaPage extends StatelessWidget {

   
  final activitiesProvider = new ActivityProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Programa ITEC'),
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
          child: Text('Clic en la actividad para agregar a su itinerarior personalizado',
                style: TextStyle(color: Colors.black , fontSize: 15.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: activitiesProvider.getActivities(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
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
}