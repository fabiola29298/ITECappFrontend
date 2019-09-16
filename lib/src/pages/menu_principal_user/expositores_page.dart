import 'package:flutter/material.dart';
 
import 'package:itec_app/src/providers/person_provider.dart'; 
import 'package:itec_app/src/widgets/menu_widget.dart';
import 'package:itec_app/src/widgets/speaker_list.dart'; 
class ExpositoresPage extends StatelessWidget {

   
  final personProvider = new PersonProvider();
  @override
  Widget build(BuildContext context) {
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