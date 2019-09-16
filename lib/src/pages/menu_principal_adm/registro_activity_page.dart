import 'package:flutter/material.dart';

import 'package:itec_app/src/bloc/provider.dart';
import 'package:itec_app/src/providers/activities_provider.dart';  
import 'package:itec_app/src/utils/utils.dart'; 
class RegistroActivityPage extends StatefulWidget {
 
  @override
  _RegistroActivityPageState createState() => _RegistroActivityPageState();
}

class _RegistroActivityPageState extends State<RegistroActivityPage> {
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  final activityProvider = new ActivityProvider(); 
  @override
  Widget build(BuildContext context) {

    final actividadBloc = Provider.activityBlocOf(context);

        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('Registro de Actividad'),  
          ),
          body:    SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[ 
                    _crearNombre(actividadBloc),
                    _crearDescription(actividadBloc),                     
                    _crearTipo(actividadBloc), 
                    _crearFecha(actividadBloc),  
                    _crearHorario(actividadBloc), 
                    _crearAula(actividadBloc),
                    _crearSpeaker(actividadBloc),
                    Text('Para charla agregar Expositor'),
                    SizedBox(height: 20.0),
                    _crearBoton(actividadBloc),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  Widget _crearNombre(ActivityBloc bloc) {

     return StreamBuilder(
      stream: bloc.nameStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.deepPurple ),
            hintText: 'Taller de Android',
            labelText: 'Titulo de la actividad*', 
            errorText: snapshot.error
          ),
          onChanged: bloc.changeName,
        ),
      );
      },
    );
  }

  Widget _crearDescription(ActivityBloc bloc) {
    return StreamBuilder(
      stream: bloc.descriptionStream,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),

        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.deepPurple ),
            hintText: ' ',
            labelText: 'Descripcion*', 
            errorText: snapshot.error
          ),
          onChanged: bloc.changeDescription,
        ),
      );
      },
    ); 
  }  
  Widget _crearTipo(ActivityBloc bloc) {

    return StreamBuilder(
      stream: bloc.typeStream,builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:  DropdownButton<String>(
        
        value: snapshot.data,
        hint: new Text('Tipo de actividad*'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        onChanged: (String newValue) {
          setState(() {  bloc.changeType(newValue); });
        },
        items: <String>['Charla', 'Taller', 'Competencia','Receso','Registro','Actividad ITEC', 'Otro']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value), );
          }).toList(),
    ),);},);
  }
  Widget _crearFecha(ActivityBloc bloc) {

    return StreamBuilder(
      stream: bloc.dateStream,builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:  DropdownButton<String>(
        
        value: snapshot.data,
        hint: new Text('Fecha*'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        onChanged: (String newValue) {
          setState(() {  bloc.changeDate(newValue); });
        },
        items: <String>['Sábado 28 sept', 'Lunes 30 sept', 'Martes 1 oct','Miercoles 2 oct','Jueves 3 oct', 'Viernes 4 oct','Sábado 5 oct' ]
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value), );
          }).toList(),
    ),);},);
  }
  Widget _crearHorario(ActivityBloc bloc) {

    return StreamBuilder(
      stream: bloc.starttimeStream,builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:  DropdownButton<String>(
        
        value: snapshot.data,
        hint: new Text('Horario*'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        onChanged: (String newValue) {
          setState(() {  bloc.changeStarttime(newValue); });
        },
        items: <String>['08:30 - 09:00','09:00 - 10:00','10:00 - 11:00','11:00 - 12:00','12:00 - 12:30','12:30 - 13:30','13:30 - 15:30','15:30- 16:30','16:30 - 17:30','17:30 - 18:00','18:00 - 19:00','19:00 - 19:30','19:30 - 20:30','08:00 - 09:30', '09:00 - 9:30', '9:30 - 12:30','12:30 - 14:00','14:00 - 17:30', '17:30 - 18:00' ]
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value), );
          }).toList(),
    ),);},);
  }
  Widget _crearAula(ActivityBloc bloc) {

    return StreamBuilder(
      stream: bloc.classroomStream,builder: (BuildContext context, AsyncSnapshot snapshot){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:  DropdownButton<String>(
        
        value: snapshot.data,
        hint: new Text('Aula*'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        onChanged: (String newValue) {
          setState(() {  bloc.changeClassroom(newValue); });
        },
        items: <String>['TEAL A','TEAL B','TEAL C','Auditorio 2 - Bloque D','Auditorio 3 - Bloque D','Auditorio 4 - Bloque D','Paraninfo - Piso 5 Bloque D' , 'Coliseo UCB', 'Coliseo Don Bosco' ]
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value), );
          }).toList(),
    ),);},);
  }
   Widget _crearSpeaker(ActivityBloc actividadBloc){
     return Container();
  }

  Widget _crearBoton(ActivityBloc bloc) {
    
    return StreamBuilder(
      stream: bloc.fromValidStram,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Guardar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed:  (){
            if( bloc.name == null || bloc.description == null || bloc.type == null || bloc.date == null || bloc.starttime == null || bloc.classroom == null   ){
              mostrarAlerta(context, 'Ingresar todos los datos');
              return;
            }
            if( bloc.name == '' || bloc.description == '' || bloc.type == '' || bloc.date == '' || bloc.starttime == '' || bloc.classroom == ''   ){
              mostrarAlerta(context, 'Ingresar todos los datos del formulario');
              return;
            }
            _submit(bloc, context);
          }   
        );
      },
    );
  }

    void _submit(ActivityBloc bloc, BuildContext context) async {
      mostrarCargando( context,'Guardando Actividad'  );
    print("respuesta: ${bloc.name} - ${bloc.description} - ${bloc.type} - ${bloc.date} - ${bloc.starttime} - ${bloc.classroom}  ");
      
      Map info = await activityProvider.nuevoActividad(bloc.name, bloc.description, bloc.type, bloc.date, bloc.starttime, bloc.classroom );

      if ( info['ok'] ) {
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, 'menumaterial');
      } else {
        Navigator.of(context).pop();
        mostrarAlerta( context, info['mensaje'] );
      }
      
      
  }
/*
  void mostrarSnackbar(String mensaje){

    final snackbar = SnackBar(
      content:  Text(' . $mensaje'),
      duration:  Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }
 */
}