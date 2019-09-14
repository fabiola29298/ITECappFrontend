import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'dart:convert';
import 'package:itec_app/src/models/activity_model.dart';
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:mime_type/mime_type.dart';
class ActivityProvider{
  final _prefs = new PreferenciasUsuario();

  //String _apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VhcmlvIjp7InJvbGUiOiJBRE1JTl9ST0xFIiwic3RhdHVzIjp0cnVlLCJnb29nbGUiOmZhbHNlLCJfaWQiOiI1ZDU3ODg4ZjE1Zjg2YzAwMTYyNjI4ZjkiLCJuYW1lIjoiYWRtaW4xMCIsImxhc3RfbmFtZSI6Imxhc3RfYWRtaW4iLCJlbWFpbCI6ImFkbWluMTBAZ21haWwuY29tIiwiX192IjowfSwiaWF0IjoxNTY3MjIyMzc5LCJleHAiOjE1NjcyMjQ5NzF9.vEBXpIsN3UnpaGTMEumSA-IlMqOl62VR8Cs4xv8Sbjg';
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


  Future<String> subirImagen( File imagen ) async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dsgwbxs8g/image/upload?upload_preset=to3t6mrc');
    final mimeType = mime(imagen.path).split('/'); //image/jpeg

    final imageUploadRequest = http.MultipartRequest(
      'POST',
      url
    );

    final file = await http.MultipartFile.fromPath(
      'file', 
      imagen.path,
      contentType: MediaType( mimeType[0], mimeType[1] )
    );

    imageUploadRequest.files.add(file);


    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if ( resp.statusCode != 200 && resp.statusCode != 201 ) {
      print('Algo salio mal');
      print( resp.body );
      return null;
    }

    final respData = json.decode(resp.body);
    print('respData $respData' );

    return respData['secure_url'];


  }


}