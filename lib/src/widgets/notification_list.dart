import 'package:flutter/material.dart';
import 'package:itec_app/src/models/notification_model.dart';
import 'package:itec_app/src/models/notification_model.dart' as prefix0;
import 'package:itec_app/src/providers/notifcation_provider.dart'; 

class NotificationList extends StatelessWidget {
  final List<prefix0.Notification> notifications;
 //final _prefs = new PreferenciasUsuario();
 final notificationProvider = new NotificationProvider(); 
  NotificationList({@required this.notifications});

  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    //final _screenSize = MediaQuery.of(context).size;

    return  Column(
           
           children: _notificationCard(context),
         ) ;
  }

  List<Widget> _notificationCard (BuildContext context){
    return notifications.map((notificationData){  
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
                ListTile(
                 
               // contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                leading:   
                Icon ( Icons.notification_important, color: Colors.blue ),
                //new Image.asset(  'assets/img/menu-img.jpg'  , fit: BoxFit.cover,  width: 120.0,
                //  ),
                 
                title: Text(
                  notificationData.name,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Text(
                      'Descripcion: ${notificationData.description}  ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Fecha: ${notificationData.dateTime}',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                     
                    SizedBox(height: 5.0),
                     
                     ]), 
                onTap: () { /* react to the tile being tapped */ 
                      
                     // print('ID notificationData: ${notificationData.id}');
                     // print('ID person  : ${_prefs.idpref}');
                     // _register(context, notificationData.id);
                },dense: true,

              ),
              Divider()
               
            ],
          ),
         
      );
    }).toList();
  }
/*   void _register(BuildContext context, String idActivity ) async { 
            
 
    
  }
*/
 
  
  

  
}