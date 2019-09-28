import 'package:flutter/material.dart';
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/models/assist_control_model.dart';
import 'package:itec_app/src/models/assist_model.dart';
import 'package:itec_app/src/models/person_model.dart';
import 'package:itec_app/src/providers/assist_provider.dart';
import 'package:itec_app/src/providers/person_provider.dart';
import 'package:itec_app/src/search/search_activity_nombre.dart';
import 'package:itec_app/src/search/search_person.dart';
import 'package:itec_app/src/utils/utils.dart';
import 'package:itec_app/src/widgets/menu_widget.dart';
import 'package:intl/intl.dart';
class ListaAsistenciaPage extends StatefulWidget {
  @override
  _ListaAsistenciaPageState createState() => _ListaAsistenciaPageState();
}

class _ListaAsistenciaPageState extends State<ListaAsistenciaPage> {
  final personProvider = new PersonProvider();
  final assistProvider = new AssistProvider();
  String nombreData='prueba';
  DateTime now; 
  String formattedDate;  
   String _idParticipante , _nameParticipante, _idAssistControl;
  @override
  Widget build(BuildContext context) {
    Control prodData = ModalRoute.of(context).settings.arguments;
    Activity activity = Activity.fromJsonMap(prodData.activity);
    Person   person = Person.fromJsonMap(prodData.person);
    now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd kk:mm:ss').format(now);
    _idAssistControl=prodData.id;
    print('lisa: $prodData');
      return Scaffold(
        appBar:AppBar(
          title: Text('Lista de asistencia'),
        ) ,
        drawer: MenuWidget(),
        body: 
        SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
              
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[ 
                SizedBox(height: 15.0,),
                cardControl(activity,person),  
                Divider(),
                SizedBox(height: 10.0,),
                Text('Ingresa nuevos participantes'),
                _buscarParticipante(context),
                _crearParticipante(context),
                _crearBoton(context), 
                Divider(),
                SizedBox(height: 10.0,),
                Text('Lista de participantes \nDesliza a la derecha para eliminar'),
                _obtenerActivitiesCard(context)
                
            ],
          ), 
          ),
        ),
      );
  }

  Widget cardControl( Activity activity, Person person){
    return Column(
      children: <Widget>[
        ListTile(
                 
               // contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                leading: 
                Icon ( Icons.check_box, color: Colors.blue ),
                //new Image.asset(  'assets/img/menu-img.jpg'  , fit: BoxFit.cover,  width: 120.0,
                //  ),
                 
                title: Text(
                  '${activity.name}', //nombre de actividad
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                subtitle: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    Text(
                      'Fecha: ${activity.date}    \nHora: ${activity.startTime}  ',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Tipo: ${activity.type}',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                    Text(
                      'Lugar: Aula ${activity.classroom} ',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ), 
                    SizedBox(height: 5.0),
                    
                    Text(
                      'Encargado: ${person.name} ${person.lastName}',
                      style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                    ),
                     ]), 
                onTap: () { /* react to the tile being tapped */ 
                      
                     // print('ID activity: ${activity.id}');
                     // print('ID person  : ${_prefs.idpref}');
                     // _register(context, activity.id);
                     //Navigator.pushNamed(context, 'listaAsistenciaAdmin' ,arguments: control ); 
                },dense: true,

              ),
      ],
    );
  }
  
  
  Widget _buscarParticipante(BuildContext context){

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Divider(),
        Text('Buscar: '),
        Container(
          child: IconButton(
                
                icon: Icon(Icons.search),
               onPressed: () {
                  showSearch(
                  
                    context: context, 
                    delegate: PersonSearch( ),
                    // query: 'Hola'
                    );
                },
              ),),
      ],
    );
  }
  
  Widget _crearParticipante(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: 
          FutureBuilder(
           future: personProvider.getParticipants(), 
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
        
        
        hint: Text('Selecciona Participante *'),
        icon: Icon(Icons.arrow_drop_down), iconSize: 30, isExpanded: true, elevation: 16,
        underline: Container( height: 2, color: Colors.deepPurpleAccent, ),
        
        items: data.map((item) {
          _nameParticipante= '${item.name} ${item.lastName}';
            return DropdownMenuItem<String>(
              value: item.id, child: Text('${item.name} ${item.lastName}'), );
          }).toList(),

        onChanged: (String newValue) {
          setState(() {  _idParticipante= newValue; });
        },

        value: _idParticipante,
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
            if( _idParticipante ==null || _nameParticipante ==null ){
              mostrarAlerta(context, 'Ingresar todos los datos');
              return;
            } 
            _submit( context);
            
          }   
        );
       
  }

  void _submit(BuildContext context) async {
     mostrarCargando(context, 'Guardando nuevo asistente');        
      Map info = await assistProvider.nuevoAssist(_idAssistControl,_idParticipante,formattedDate);

      if ( info['ok'] ) {
        Navigator.of(context).pop();
        onState(){} 
      } else {
        Navigator.of(context).pop();
        mostrarAlerta( context, info['mensaje'] );
      }
      
      
  }
void  submitSearch(String id) async {
     mostrarCargando(context, 'Guardando nuevo asistente');        
      Map info = await assistProvider.nuevoAssist(_idAssistControl,id,formattedDate);

      if ( info['ok'] ) {
        Navigator.of(context).pop();
        onState(){} 
      } else {
        Navigator.of(context).pop();
        mostrarAlerta( context, info['mensaje'] );
      }
      
      
  }
  Widget _obtenerActivitiesCard(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Container(
          padding: EdgeInsets.only(left:20.0),
          child: Text(' ',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
                )),
          SizedBox(height: 5.0),
          FutureBuilder(
           future: assistProvider.buscarAssistbyControl(_idAssistControl), 
           builder: (BuildContext context, AsyncSnapshot<List> snapshot) { 
             if(snapshot.hasData){
               return Column(
                children: _scheduleCard(context, snapshot.data)); 
             }else{
               return Center(child: CircularProgressIndicator());
             } 
           },
         ), 
      ],),
    );
  }

   List<Widget> _scheduleCard (BuildContext context, List<Assist> assist){
    return assist.map((assist){ 
      //Control control = Control.fromJsonMap(assist.assistcontrol);
      Person person= Person.fromJsonMap(assist.person); //Staff que registro
      return Container(
        margin: EdgeInsets.all( 5.0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 1.0, // has the effect of softening the shadow
              spreadRadius: 2.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ]),
             
        child:  Dismissible(
              
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: ( direccion ){
                assistProvider.borrarAssist(assist.id);
              },
              
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ 
                  ListTile(               
                  title: Text(
                    '${person.name} ${person.lastName}',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  subtitle: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    
                    children: <Widget>[
                      SizedBox(height: 5.0),
                      Text(
                        'Fecha: ${assist.dateTime}',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Staff que registro: ${person.name} ${person.lastName}',
                        style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                      ),
                      Text(
                        'Feedback: ${assist.feedback}',
                        style: new TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal, )
                      )                
                       ]), 
                  onTap: () { /* react to the tile being tapped */ 
                        
                  },dense: true,
                )          
              ],
            ),
        ),
         
      );
    }).toList();
  }
}