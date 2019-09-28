import 'package:flutter/material.dart';

import 'package:itec_app/src/providers/menu_provider.dart'; 
import 'package:itec_app/src/utils/icono_string_util.dart';
import 'package:itec_app/src/utils/utils.dart'; 

import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart'; 
class MenuPage extends StatelessWidget {
  static final String routeName = 'MenuPage';
  final prefs = new PreferenciasUsuario();
  
  @override 
  Widget build(BuildContext context) {
    
    bool prodData = ModalRoute.of(context).settings.arguments;
   print('Es admi tambien: $prodData');
    
      if (prodData==false) {
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
      if (prodData){
      //mostrarBienvenido(context);
        return Scaffold(
       appBar: AppBar(
         title:Text('ITEC App'),
       ),
       body: _lista(),
     );
      }
       

     
  }
  Widget _lista() {
 
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ){
        return ListView(
          children: _listaItems( snapshot.data, context ),
        );
      },
    );
  }


  List<Widget> _listaItems( List<dynamic> data, BuildContext context ) {

    final List<Widget> opciones = [];
 

    data.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        leading:  getIcon( opt['icon'] ) ,
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {
          if(opt['ruta']=='scroll'){
            cerrarSesion();
          }
          Navigator.pushNamed(context, opt['ruta'], arguments: opt['texto'] ); 
        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

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
            Color(0xFF1D3F57),
            Color(0xFF1F636E)
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
                SizedBox(height: 15.0,),
                Text('ITEC 2019', style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 10.0,),
                Text('Innovation Technology Engineering Congress UCB', style: TextStyle(color: Colors.white, fontSize: 12.0 )),
                SizedBox(height: 10.0,),
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
            _crearBotonRedondeado(context, Icons.calendar_today, 'Programa de actividades','programaUser'), 
            _crearBotonRedondeado(context, Icons.schedule, 'Mi Itinerario Personalizado','itinerarioUser'), 
          ],
          
         ),
         
         TableRow(
          children:[
           _crearBotonRedondeado(context, Icons.people, 'Expositores','notificacionesUser'), 
          _crearBotonRedondeado(context, Icons.border_all, 'Mapa del Campus','notificacionesUser'), 
          ]
         ),
        // TableRow(
        //  children:[
            
             // _crearBotonRedondeado(context, Icons.announcement, 'Auspiciadores','notificacionesUser'), 
        //    _crearBotonRedondeado(context, Icons.dashboard, 'Notificaciones','notificacionesUser'), 
        //  ]
       //  ),
         TableRow(
          children:[
            _crearBotonRedondeado(context, Icons.border_all, 'Asistencia','asistenciaUser'),  
           _crearBotonRedondeado(context, Icons.account_circle, 'Cerrar sesion / Salir','scroll'),  
          ]
         ),
      ],
    );
  }

  Widget  _crearBotonRedondeado(BuildContext context,  IconData icono, String texto, String url){



    return ClipRect(
        
        child: Container(
          height: 120.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
             
            borderRadius: BorderRadius.circular(20.0)
          ),
          
          child:   RaisedButton( 
                color: Color.fromRGBO(31, 57, 110, 0.7),
                onPressed: (){
                  if(url=='scroll'){cerrarSesion();}
                    Navigator.pushNamed(context,url,arguments:texto); 
                },
                child: Column(
                  children: <Widget>[
                   
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(31, 57, 110, 0.0),
                      radius: 35.0,
                      child: Icon( icono, color: Colors.white54, size: 30.0 ),
                    ),
                    Text( texto , style: TextStyle( color: Colors.white54 )),
                    
                  ],
                ),
              ),
        ),
        
          
    );
  }

     
  
}

  
  