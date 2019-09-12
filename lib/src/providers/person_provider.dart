import 'dart:convert';

 
import 'package:http/http.dart' as http;
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

class PersonProvider {
  String _url  ='https://itec-ucb.herokuapp.com';
  final _prefs = new PreferenciasUsuario();

  //LOGIN
  Future<Map<String, dynamic>> login( String email, String password) async {

    Map<String, dynamic>  authData = {'email': email,'password' : password};
    final url = '$_url/login';
    final resp = await http.post(url,body:  authData); 

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}'); 
    //print('usuario: ${decodedResp['usuario']}');
    //print('token: ${decodedResp['token']}');

    if ( decodedResp.containsKey('usuario') ) {
      
      _prefs.token = decodedResp['token'];

      return { 'ok': true, 'token': decodedResp['token'] };
    } else {  
      return { 'ok': false, 'mensaje': decodedResp['err']['message']  };
    }

  }


  Future<Map<String, dynamic>> nuevoUsuario(String name, String lastname, String email, String password ) async {

    Map<String, dynamic>  authData = {'email': email,'password' : password,'name':name,'last_name':lastname};
    final url = '$_url/person';
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
