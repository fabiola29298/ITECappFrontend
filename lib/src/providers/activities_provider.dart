 
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


    Future<Map<String, dynamic>> nuevoActividad(String name,String description,String type,String date,String starttime,String classroom ) async {

    Map<String, dynamic>  authData = {'name': name,'description' : description,'type':type,'date':date, 'start_time': starttime, 'classroom': classroom,'end_time': starttime,'block_campus': classroom };
    final url = Uri.https(_url, 'activity',{
      'token' : _prefs.token
    } );
    final resp = await http.post(url,body:  authData);  

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}');  

    if ( decodedResp.containsKey('person') ) {
     // return login(email, password); 
      return { 'ok': false, 'mensaje': ' ${decodedResp['err']}'  };
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




}