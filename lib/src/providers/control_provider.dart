 
import 'package:http/http.dart' as http;
import 'package:itec_app/src/models/assist_control_model.dart'; 

import 'dart:convert'; 
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

class ControlProvider {
  String _url  ='itec-ucb.herokuapp.com';
  String _url2  ='https://itec-ucb.herokuapp.com';
  final _prefs = new PreferenciasUsuario();


  Future <List<Control>> getControls() async{
    final url = Uri.https(_url, 'control',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
     
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final activitiesData = new Controles.fromJsonList(decodedData['control']);
    //final dt = activitiesData.items;
    print('decode Control:$decodedData');
    return activitiesData.items;
  }



  Future
  <Map<String, dynamic>> nuevoControl(String activity, String person, String nameStaff, String nameActivity ) async {

    Map<String, dynamic>  authData = {'activity': activity,'person' : person,'name_staff': nameStaff ,'name_activity' : nameActivity};
    final url = '$_url2/control';
    final resp = await http.post(url,body:  authData); 

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}'); 
    //print('person: ${decodedResp['person']}'); 

    if ( decodedResp.containsKey('control') ) {
      return { 'ok': true, 'mensaje': ' ${decodedResp['control']}'  };
    } else {  
      return { 'ok': false, 'mensaje': ' ${decodedResp['err']}'  };
    }
  }



}