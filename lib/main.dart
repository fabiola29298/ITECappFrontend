import 'package:flutter/material.dart';

import 'package:itec_app/src/bloc/provider.dart'; 
import 'package:itec_app/src/pages/pantalla_principal/scroll_page.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:itec_app/src/routes/routes.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
    prefs.initPrefs();
  runApp(MyApp());
} 
 

class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(13,71,161,1.0);
   // const Color secondaryColor = Color.fromRGBO(249,168,37,1.0);

     
    
    return Provider(
      child: MaterialApp(
        title: 'ITEC APP',
        debugShowCheckedModeBanner: false,
        initialRoute: 'scroll',
         routes: getAplicationRouter(),
         onGenerateRoute: (setting){
           return MaterialPageRoute(builder: (context)=>ScrollPage());
         },
         theme: ThemeData(
          //brightness: Brightness.dark,
          accentColorBrightness: Brightness.dark,
          primaryColor: Color.fromRGBO(13,71,161,1.0),
          primaryColorLight: Color(0xFF1D3F57),
          primaryColorDark: Color.fromRGBO(0,33,113, 1.0),
          buttonColor: Color.fromRGBO(13,71,161,1.0), 
          accentColor: Color.fromRGBO(249,168,37,1.0), 
          buttonTheme: ButtonThemeData( 
            textTheme: ButtonTextTheme.primary,
            disabledColor: Color.fromRGBO(142,142,142,1.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            buttonColor: primaryColor, 
             
          ),

          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
            //para el boton probar el color en disable
      ),
      ),
    );
  }
}

