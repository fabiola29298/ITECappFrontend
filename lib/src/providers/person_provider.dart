import 'dart:convert';

 
import 'package:http/http.dart' as http;
import 'package:itec_app/src/models/person_model.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

class PersonProvider {
  String _url  ='itec-ucb.herokuapp.com';
  final _prefs = new PreferenciasUsuario();
  String _url2  ='https://itec-ucb.herokuapp.com';
  //LOGIN
  Future<Map<String, dynamic>> login( String email, String password) async {

    Map<String, dynamic>  authData = {'email': email,'password' : password};
    final url = '$_url2/login';
    final resp = await http.post(url,body:  authData); 

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}'); 
    //print('usuario: ${decodedResp['usuario']}');
    //print('token: ${decodedResp['token']}');

    if ( decodedResp.containsKey('usuario') ) {
      
      _prefs.token = decodedResp['token'];
      _prefs.idpref = decodedResp['usuario']['_id'];

      return { 'ok': true, 'token': decodedResp['token'] };
    } else {  
      return { 'ok': false, 'mensaje': decodedResp['err']['message']  };
    }

  }
Future <List<Person>> getSpeakers() async{
    final url = Uri.https(_url, 'person/buscar/speaker',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final activitiesData = new People.fromJsonList(decodedData['person']);
    //final dt = activitiesData.items;
    print('decode:{$decodedData}');
    return activitiesData.items;
  }

  Future<Map<String, dynamic>> nuevoUsuario(String name, String lastname, String email, String password, String genero, String carrera, String tipoInscripcion ) async {

    Map<String, dynamic>  authData = {'email': email,'password' : password,'name':name,'last_name':lastname, 'gender': genero, 'career': carrera, 'type_inscription': tipoInscripcion};
    final url = '$_url2/person';
    final resp = await http.post(url,body:  authData); 

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}'); 
    //print('person: ${decodedResp['person']}'); 

    if ( decodedResp.containsKey('person') ) {
      return login(email, password); 
    } else {  
      return { 'ok': false, 'mensaje': ' ${decodedResp['err']}'  };
    }
  }



}
