import 'package:flutter/material.dart'; 

 
import 'package:itec_app/src/models/assist_model.dart'; 
import 'package:itec_app/src/providers/assist_provider.dart';
import 'package:itec_app/src/utils/utils.dart'; 

class AssistUserList extends StatefulWidget {
   String _feedback='';
  final List<Assist> assist;

  AssistUserList({@required this.assist});

  @override
  _AssistUserListState createState() => _AssistUserListState();
}

class _AssistUserListState extends State<AssistUserList> {
  String feedback;

 final assistProvider = new AssistProvider(); 

  @override
  Widget build(BuildContext context) {
    //dimenciones del dispositivo
    //final _screenSize = MediaQuery.of(context).size;

    return  Column(
           
           children: _assistCard(context),
         ) ;
  }

  List<Widget> _assistCard (BuildContext context){
    return widget.assist.map((assist){ 
      print('control: ${assist.assistcontrol}');
      String nameactivity= assist.assistcontrol['name_activity'] ;
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
          
              child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ 
                  ListTile(
                   
                  trailing: 
                   Column(
                  children: <Widget>[
                    Icon ( Icons.message, color: Colors.blue ),
                    Text(
                      'Agregar \ncomentario',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10.0),
                    ),
                  ],
                ),
                   
                   
                  title: Text(
                    nameactivity,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  subtitle: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                      SizedBox(height: 5.0),
                      Text(
                        'Fecha: ${assist.dateTime} \nComentario: ${assist.feedback}',
                        style: TextStyle(color: Colors.black , fontSize: 10.0),
                      ),
                      SizedBox(height: 5.0),
                      
                       ]), 
                  onTap: () { mostrarMensajeFeedback(context, assist);
                  },dense: true,

                ) 
                 
              ],
            ),
        
         
      );
    }).toList();
  }

void mostrarMensajeFeedback(BuildContext context, Assist assist ) {

  showDialog(
    context: context,
    builder: ( context ) {
      return AlertDialog( 
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: _crearComentario(assist)
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Guardar'),
            onPressed: (){ 
              _submit(context, feedback, assist);
              Navigator.of(context).pop();
            }
          )
        ],
      );
    }
  );


}

   Widget _crearComentario (Assist assist ) {
        
      return  
        TextField(
      //autofocus: true, //automaticamente se pone por defecto
      //textCapitalization: TextCapitalization.sentences, //Mayuscula por cada palabra
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        
        hintText: 'Comentario \n',
        labelText: 'Comentario \n',
        helperText: 'Agrega tu comentario',
        suffixIcon: Icon(Icons.text_fields),
        icon: Icon(Icons.message),

      ),

      onChanged: (valor){
       
        setState(() {
           feedback=valor; 
        });
      },

    );
 

  } 


    void _submit(BuildContext context, String comentario, Assist assist) async {
     mostrarCargando  (context, 'Guardando nueva lista de control de asistencias');
     
     assist.feedback='hola123456789';
     print(assist.feedback);
     bool info = await assistProvider.editarFeedback(assist,comentario) ;

      if ( info  ) {
        Navigator.of(context).pop();
        //Navigator.pushReplacementNamed(context, 'menuPage');
      } else {
        Navigator.of(context).pop();
        mostrarAlerta( context, 'error al guardar.' );
      }
      
      
  }
}