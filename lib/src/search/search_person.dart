

import 'package:flutter/material.dart';
import 'package:itec_app/src/models/person_model.dart';
import 'package:itec_app/src/models/person_model.dart';
import 'package:itec_app/src/providers/assist_provider.dart'; 
import 'package:itec_app/src/providers/person_provider.dart';
import 'package:itec_app/src/utils/utils.dart';


class PersonSearch extends SearchDelegate {

  String seleccion = '';
  final personProvider = new PersonProvider();
 final assistProvider = new AssistProvider();

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
      future: personProvider.getPersonbyname(query),
      builder: (BuildContext context, AsyncSnapshot<List<Person>> snapshot) {

          if( snapshot.hasData ) {
            
            final people = snapshot.data;

            return ListView(
              children: people.map( (person) {
                String id= person.id;
                  return ListTile(
                    //leading:  Icon(Icons.ac_unit),
                    title: Text( '${person.name} ${person.lastName}'),
                    subtitle: Text( '${person.email} \n${person.career}' ),
                    onTap: (){
                      
                       //submitSearch(person.id);
                       close( context, null);


                      
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

}