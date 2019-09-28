import 'package:flutter/material.dart'; 

import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';
void cerrarSesion(){
  final _prefs = new PreferenciasUsuario();
  _prefs.idpref = '';
  _prefs.token ='';
  _prefs.typeUSer = 'USER_ROLE'; 
  _prefs.ultimaPagina='';

}
bool isNumeric( String s ) {

  if ( s.isEmpty ) return false;

  final n = num.tryParse(s);

  return ( n == null ) ? false : true;

}

void mostrarAlerta(BuildContext context, String mensaje ) {

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );


}
void mostrarGuardado(BuildContext context, String mensaje ) {

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        title: Text('Guardado'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: ()=> Navigator.of(context).pop(),
          )
        ],
      );
    }
  );


}
void mostrarCargando(BuildContext context, String mensaje ) {

  showDialog(
    context: context,
    
    builder: ( context ) {
      return AlertDialog(
        //title: Text('Cargando'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new Text("Cargando.. \n$mensaje"),
                    
                  ),
          ],
        )
         
      );
    }
  );
 

}
void mostrarBienvenido(BuildContext context ) {

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog(
        //title: Text('Cargando'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: new Text("Bienvenido STAFF   "),
                  ),
          ],
        )
         
      );
    }
  );
 

}
