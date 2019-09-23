 
import 'package:http/http.dart' as http; 

import 'dart:convert';
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart'; 
class ActivityProvider{
  final _prefs = new PreferenciasUsuario();

  String _url    = 'itec-ucb.herokuapp.com';

  //Mostrar - GET / Movie/now_playing

  Future <List<Activity>> getActivities() async{
    final url = Uri.https(_url, 'activity',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final activitiesData = new Activities.fromJsonList(decodedData['activity']);
    //final dt = activitiesData.items;
    print('decode:{$decodedData}');
    return activitiesData.items;
  }

  // Crear - POST


    Future<Map<String, dynamic>> nuevoActividad(String name,String description,String type,String date,String starttime,String classroom, String person ) async {

    Map<String, dynamic>  authData;
    if(person==null){
      authData = {'name': name,'description' : description,'type':type,'date':date, 'start_time': starttime, 'classroom': classroom,'end_time': starttime,'block_campus': classroom };
    
    }
    else{
      authData = {'name': name,'description' : description,'type':type,'date':date, 'start_time': starttime, 'classroom': classroom,'end_time': starttime,'block_campus': classroom,'person':person };
    
    }
    
    final url = Uri.https(_url, 'activity',{
      'token' : _prefs.token
    } );
    final resp = await http.post(url,body:  authData);  

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}');  

    if ( decodedResp.containsKey('activity') ) {
     // return login(email, password); 
      return { 'ok': true, 'mensaje': 'Guardado exitoso: ${decodedResp['activity']}'  };
    } else {  
      return { 'ok': false, 'mensaje': ' ${decodedResp['err']}'  };
    }
  }

   // Editar - PUT

  Future<bool> editarActividad( Activity item ) async {
    
    final url = Uri.https(_url, 'activity/${item.id}',{
      'token' : _prefs.token
    } );

    final resp = await http.post( url, body: activityModelToJson(item) );
    final decodedData = json.decode(resp.body);
    print( decodedData );
    return true;

  }


  Future<int> borrarActividad( String id ) async {
    final url = Uri.https(_url, 'activity/$id',{
      'token' : _prefs.token
    } ); 
    final resp = await http.delete(url);
    print( resp.body );
    return 1;
  } 

  //Mostrar - GET / Movie/now_playing

  Future <List<Activity>> buscarTipo(String tipo) async{
    final url = Uri.https(_url, 'activity/buscar/tipo/$tipo',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final activitiesData = new Activities.fromJsonList(decodedData['activity']);
    //final dt = activitiesData.items;
    print('decode:{$decodedData}');
    return activitiesData.items;
  }

  //Mostrar - GET / Movie/now_playing

  Future <List<Activity>> buscarNombre(String nombre) async{
    final url = Uri.https(_url, 'activity/buscar/name/$nombre',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final activitiesData = new Activities.fromJsonList(decodedData['activity']);
    //final dt = activitiesData.items;
    print('decode:{$decodedData}');
    return activitiesData.items;
  }

    //Mostrar - GET / Movie/now_playing

  Future <List<Activity>> buscarId(String id) async{
    final url = Uri.https(_url, 'activity/buscar/id/$id',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final activitiesData = new Activities.fromJsonList(decodedData['activity']);
    //final dt = activitiesData.items;
    print('decode:{$decodedData}');
    return activitiesData.items;
  }
}