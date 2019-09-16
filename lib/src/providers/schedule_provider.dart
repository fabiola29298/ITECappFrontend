 
import 'package:http/http.dart' as http; 

import 'dart:convert';
import 'package:itec_app/src/models/schedule_model.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

class ScheduleProvider {
  String _url  ='itec-ucb.herokuapp.com';
  String _url2  ='https://itec-ucb.herokuapp.com';
  final _prefs = new PreferenciasUsuario();


  Future <List<Schedule>> getSchedules() async{
    final url = Uri.https(_url, 'schedule/${_prefs.idpref}',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
     
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final activitiesData = new Schedules.fromJsonList(decodedData['schedule']);
    //final dt = activitiesData.items;
    print('decode Schedule:$decodedData');
    return activitiesData.items;
  }



  Future
  <Map<String, dynamic>> nuevoSchedule(String activity ) async {

    Map<String, dynamic>  authData = {'activity': activity,'person' : _prefs.idpref};
    final url = '$_url2/schedule';
    final resp = await http.post(url,body:  authData); 

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}'); 
    //print('person: ${decodedResp['person']}'); 

    if ( decodedResp.containsKey('schedule') ) {
      return { 'ok': true, 'mensaje': ' ${decodedResp['schedule']}'  };
    } else {  
      return { 'ok': false, 'mensaje': ' ${decodedResp['err']}'  };
    }
  }



}