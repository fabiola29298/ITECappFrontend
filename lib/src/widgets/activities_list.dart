import 'package:flutter/material.dart';
import 'package:itec_app/src/models/activity_model.dart';

class ActivitiesList extends StatelessWidget {
  final List<Activity> activities;

  ActivitiesList({@required this.activities});

  //escuchar todos los cambios del controller
    final _pageController = new PageController(
      initialPage: 1,
      viewportFraction: 0.3
    );

  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    final _screenSize = MediaQuery.of(context).size;

    return Container(
       //height: _screenSize.height *0.5,
       child: Column ( 
         children: _activitiesCard(),

          
        ),
    );
  }

  List<Widget> _activitiesCard (){
    return activities.map((activity){
      return Container(
        margin: EdgeInsets.all( 10.0),
         
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ 
                ListTile(
                leading: Icon(Icons.map, size: 50.0,),
                trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
                title: Text(activity.name),
                subtitle: Text(activity.description), 
                onTap: () { /* react to the tile being tapped */ },dense: true,

              ),
              Divider()
               
            ],
          ),
        ),
      );
    }).toList();
  }
}