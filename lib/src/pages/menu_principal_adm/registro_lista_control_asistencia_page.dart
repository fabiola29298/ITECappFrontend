import 'package:flutter/material.dart'; 
 
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/models/person_model.dart';
import 'package:itec_app/src/pages/menu_principal_adm/lista_control_asistencia_page.dart';
import 'package:itec_app/src/providers/activities_provider.dart';
import 'package:itec_app/src/providers/control_provider.dart';
import 'package:itec_app/src/providers/person_provider.dart';  
import 'package:itec_app/src/utils/utils.dart';
import 'package:itec_app/src/widgets/control_list.dart'; 


class RegistroListaControlAsistenciaPage extends StatefulWidget {
  @override
  _RegistroListaControlAsistenciaPageState createState() => _RegistroListaControlAsistenciaPageState();
}

class _RegistroListaControlAsistenciaPageState extends State<RegistroListaControlAsistenciaPage> {
  final formKey     = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  final activityProvider = new ActivityProvider(); 
  final personProvider = new PersonProvider();
  final controlProvider = new ControlProvider();

  String _idStaff , _nameStaff;
  String _idActivity, _nameActivity;
  List data = List(); //edited line
 

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text('Crear nueva lista de contro de asistencia'),  
          ),
          body:    SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[  
                    _crearStaff(context),  
                    SizedBox(height: 10.0),
                    _crearHorario(context),  
                    SizedBox(height: 20.0),
                    _crearBoton(context),
                    SizedBox(height: 20.0),
                                                            
                    SizedBox( height: 10.0),
                    _obtenerControlCard(context),
                                                                             
                    
                  ],
                ),
              ),
            ),
          ),
    );
  }
 Widget _obtenerControlCard(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text('Listas de control de asistencias de participantes ',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: controlProvider.getControls(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return ControlList(control: snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
    );
  } 
  Widget _crearStaff(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: 
          FutureBuilder(
           future: personProvider.getStaff(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return _crearDropBoxStaff(snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
        ),
      ],
    ));
    
  }

  Widget _crearDropBoxStaff( List<Person> data){

    return   Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:  DropdownButton<String>(
        
        
        hint: Text('Selecciona Staff *'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        
        items: data.map((item) {
          _nameStaff= '${item.name} ${item.lastName}';
            return DropdownMenuItem<String>(
              value: item.id, child: Text('${item.name} ${item.lastName}'), );
          }).toList(),

        onChanged: (String newValue) {
          setState(() {  _idStaff= newValue; });
        },

        value: _idStaff,
    ),);
  }
  
  Widget _crearHorario(BuildContext context) {

    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: 
          FutureBuilder(
           future: activityProvider.getActivities(), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return _crearDropBoxActivity(snapshot.data);
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
        ),
      ],
    ));
  }
   
  Widget _crearDropBoxActivity( List<Activity> data){

    return   Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:  DropdownButton<String>(
        
        
        hint: Text('Selecciona Actividad *'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        
        items: data.map((item) {
          _nameActivity= '${item.name}';
            return DropdownMenuItem<String>(
              value: item.id, child: Text('${item.name} '), );
          }).toList(),

        onChanged: (String newValue) {
          setState(() {  _idActivity= newValue; });
        },

        value: _idActivity,
    ),);
  }
  
  Widget _crearBoton(BuildContext context) {
     
        
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
            if( _idActivity ==null || _idStaff ==null ){
              mostrarAlerta(context, 'Ingresar todos los datos');
              return;
            } 
            _submit( context);
          }   
        );
       
  }

    void _submit(BuildContext context) async {
     mostrarCargando(context, 'Guardando nueva lista de control de asistencias');        
      Map info = await controlProvider.nuevoControl(_idActivity, _idStaff, _nameStaff, _nameActivity);

      if ( info['ok'] ) {
        Navigator.of(context).pop();
        Navigator.pushReplacementNamed(context, 'menuPage');
      } else {
        Navigator.of(context).pop();
        mostrarAlerta( context, info['mensaje'] );
      }
      
      
  }

}