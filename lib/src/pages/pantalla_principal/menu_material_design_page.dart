import 'package:flutter/material.dart'; 
import 'dart:ui'; 
class MenuMaterialDesignPage extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados(context)
              ],
            ),
          )
        ],
      ),
      
    );
  }

  Widget _fondoApp(){
    final gradiente = Container(
      width:  double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end:   FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );
    


     
    return Stack(
      children: <Widget>[
        gradiente, 
         
      ],
    );
  }

  Widget _titulos(){
    return SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('ITEC 2019', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0,),
                Text('Innovation Technology Engineering Congress UCB', style: TextStyle(color: Colors.white, fontSize: 12.0 ))
              ],
            ),
      ),
    );
  }

   

  Widget _botonesRedondeados(BuildContext context,){
    return Table(
      children: [
        TableRow(
          children:[
            _crearBotonRedondeado(context,Colors.blueAccent, Icons.calendar_today, 'Programa de actividades','programaUser'), 
            _crearBotonRedondeado(context,Colors.blueAccent, Icons.schedule, 'Mi Itinerario Personalizado','itinerarioUser'), 
          ],
          
         ),
         TableRow(
          children:[
           _crearBotonRedondeado(context,Colors.blueAccent, Icons.people, 'Expositores','expositoresUser'), 
            _crearBotonRedondeado(context,Colors.blueAccent, Icons.announcement, 'Auspiciadores','auspiciadorUser'), 
          ]
         ),
         TableRow(
          children:[
            _crearBotonRedondeado(context,Colors.blueAccent, Icons.border_all, '"Mapa del Campus','mapaUser'), 
            _crearBotonRedondeado(context,Colors.blueAccent, Icons.dashboard, 'Notificaciones','notificacionesUser'), 
          ]
         ),
         TableRow(
          children:[
            _crearBotonRedondeado(context,Colors.blueAccent, Icons.border_all, 'Asistencia','asistenciaUser'),  
           _crearBotonRedondeado(context,Colors.blueAccent, Icons.border_all, 'Asistencia','asistenciaUser'),  
          ]
         ),
      ],
    );
  }

  Widget  _crearBotonRedondeado(BuildContext context, Color color, IconData icono, String texto, String url){



    return ClipRect(
        
        child: Container(
          height: 120.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
             
            borderRadius: BorderRadius.circular(20.0)
          ),
          
          child:   RaisedButton( 
                color: Color.fromRGBO(62, 66, 107, 0.7),
                onPressed: (){
                    Navigator.pushNamed(context,   url   ); 
                },
                child: Column(
                  children: <Widget>[
                   
                    CircleAvatar(
                      backgroundColor: color,
                      radius: 35.0,
                      child: Icon( icono, color: Colors.white, size: 30.0 ),
                    ),
                    Text( texto , style: TextStyle( color: color )),
                    
                  ],
                ),
              ),
              
            
             
 
          
 
        ),
        
          
    );
  }
}