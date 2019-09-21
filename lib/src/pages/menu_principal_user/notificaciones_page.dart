import 'package:flutter/material.dart';
import 'package:itec_app/src/providers/notifcation_provider.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';

import 'package:itec_app/src/providers/activities_provider.dart'; 
import 'package:itec_app/src/providers/person_provider.dart';
import 'package:itec_app/src/widgets/notification_list.dart'; 
import 'package:itec_app/src/widgets/speaker_list.dart'; 
class NotificacionesPage extends StatefulWidget {
   
  @override
  _NotificacionesPageState createState() => _NotificacionesPageState();
}

class _NotificacionesPageState extends State<NotificacionesPage> {
  final personProvider = new PersonProvider();
  final activitiesProvider = new ActivityProvider();
  final notificationProvider = new NotificationProvider();
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
         CustomScrollView(
        slivers: <Widget>[ 
          SliverList(
            delegate: SliverChildListDelegate(
              [Text('Mapa del campus univirsitario de UCB La Paz'),
                SizedBox( height: 10.0),
               mostrarImagenCampus(context)
                
              ]
            ),
          )
        ],
      )
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
        title: Text('Notificaciones'),
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
               _obtenerNotificacionesCard(context),
                
              ]
            ),
          )
        ],
      )
         
        
      );
}
  Widget _obtenerNotificacionesCard(BuildContext context){return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text('Historial de notificaciones',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: notificationProvider.getNotifcations(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return NotificationList(notifications: snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
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


  Widget mostrarImagenCampus(BuildContext context){
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
      child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ 
                _mostrarFoto('https://res.cloudinary.com/dsgwbxs8g/image/upload/v1568934323/qxkrci6q1gcfsxk6kjlz.jpg'),
                  ListTile( 
                  leading: Icon ( Icons.account_balance, color: Colors.blue ),
                   
                  title: Text( 'Bloque de ingenieria', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0) ),
                  
                  subtitle: new Column( 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                      SizedBox(height: 5.0),
                      Text('Nuevo edificio ',style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )),
                  ]), 
                ),

                Divider()   
              ],
            ),
    ) ;
  }

    
  Widget _mostrarFoto(String url) {

    if ( url != null ) {
      
      return FadeInImage(
        
        image: NetworkImage( url ),
        placeholder: AssetImage('assets/img/jar-loading.gif'),
        height: 220.0,
        fit: BoxFit.contain,
      );

    } else {

      return Image(

        image: AssetImage('assets/no-image.png'),
        height: 220.0,
        fit: BoxFit.cover,

      );

    }

  }
}