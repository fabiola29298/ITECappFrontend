

import 'package:flutter/material.dart';
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/providers/activities_provider.dart';


class ActivitySearch extends SearchDelegate {

  String seleccion = '';
  final activityProvider = new ActivityProvider();
 

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon( Icons.clear ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close( context, null );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Son las sugerencias que aparecen cuando la persona escribe
    if ( query.isEmpty ) {
      return Container();
    }

    return FutureBuilder(
      future: activityProvider.buscarNombre(query),
      builder: (BuildContext context, AsyncSnapshot<List<Activity>> snapshot) {

          if( snapshot.hasData ) {
            
            final activitys = snapshot.data;

            return ListView(
              children: activitys.map( (activity) {
                  return ListTile(
                    //leading:  Icon(Icons.ac_unit),
                    title: Text( activity.name ),
                    subtitle: Text( activity.description ),
                    onTap: (){
                      close( context, null);
                      activity.id = '';
                      Navigator.pushNamed(context, 'activityDetalle', arguments: activity);
                    },
                  );
              }).toList()
            );

          } else {
            return Center(
              child: CircularProgressIndicator()
            );
          }

      },
    );


  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Son las sugerencias que aparecen cuando la persona escribe

  //   final listaSugerida = ( query.isEmpty ) 
  //                           ? activitysRecientes
  //                           : activitys.where( 
  //                             (p)=> p.toLowerCase().startsWith(query.toLowerCase()) 
  //                           ).toList();


  //   return ListView.builder(
  //     itemCount: listaSugerida.length,
  //     itemBuilder: (context, i) {
  //       return ListTile(
  //         leading: Icon(Icons.movie),
  //         title: Text(listaSugerida[i]),
  //         onTap: (){
  //           seleccion = listaSugerida[i];
  //           showResults( context );
  //         },
  //       );
  //     },
  //   );
  // }

}