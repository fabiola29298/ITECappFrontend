import 'package:flutter/material.dart';
import 'package:itec_app/src/providers/menu_provider.dart';
import 'package:itec_app/src/utils/icono_string_util.dart';

class MenuWidget extends StatelessWidget {
   
  @override
  Widget build(BuildContext context) {
    return Drawer( 
        child: _lista() 
      );          
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

    final List<Widget> opciones = [
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/menu-img.jpg'),
                  fit: BoxFit.cover
                )
              ),

            ),
           /* ListTile(
              leading: Icon(Icons.home, color: Colors.blue),
              trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
              title: Text('Inicio'),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            */ 
            Divider(),

    ]; 
    data.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text( opt['texto'] ),
        leading:  getIcon( opt['icon'] ) ,
        trailing: Icon ( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {

          Navigator.pushNamed(context, opt['ruta'] ); 
        },
      );

      opciones..add( widgetTemp )
              ..add( Divider() );

    });

    return opciones;

  }
}