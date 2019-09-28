import 'package:flutter/material.dart';

import 'package:itec_app/src/bloc/provider.dart'; 
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart'; 
import 'package:itec_app/src/routes/routes.dart';

void main() async {
  final prefs = new PreferenciasUsuario();
  await  prefs.initPrefs();
  runApp(MyApp());
} 
 

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final prefs = new PreferenciasUsuario();
 

    @override 
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(13,71,161,1.0);
   // const Color secondaryColor = Color.fromRGBO(249,168,37,1.0);

     
    
    return Provider(
      child: MaterialApp(
        title: 'ITEC APP',
        debugShowCheckedModeBanner: false,
        initialRoute:   prefs.ultimaPagina ,
         routes: getAplicationRouter(),
        // onGenerateRoute: (setting){ return MaterialPageRoute(builder: (context)=>HomePage());         },
         theme: ThemeData( 
          accentColorBrightness: Brightness.dark,
          primaryColor: Color.fromRGBO(13,71,161,1.0), 
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

           
            //para el boton probar el color en disable
      ),
      ),
    );
  }
}

