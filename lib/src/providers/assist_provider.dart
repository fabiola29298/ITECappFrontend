import 'dart:convert';

 
import 'package:http/http.dart' as http;
import 'package:itec_app/src/models/assist_model.dart'; 
import 'package:itec_app/src/preferencias_usuario/preferencias_usuario.dart';

class AssistProvider {
  String _url  ='itec-ucb.herokuapp.com';
  final _prefs = new PreferenciasUsuario();
  String _url2  ='https://itec-ucb.herokuapp.com';
   
Future <List<Assist>> getAssistAll() async{
    final url = Uri.https(_url, 'assist/all',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final assistData = new Assists.fromJsonList(decodedData['assist']);
    //final dt = assistData.items;
    print('getAssistAll :{$decodedData}');
    return assistData.items;
  }

Future <List<Assist>> buscarAssistbypersoncontrol(String person, String control) async{
    final url = Uri.https(_url, '/assist/buscar/pc/$person/$control',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final assistData = new Assists.fromJsonList(decodedData['assist']);
    //final dt = assistData.items;
    print('decode:{$decodedData}');
    return assistData.items;
  }

Future <List<Assist>> buscarAssistbyControl(String control) async{
    final url = Uri.https(_url, '/assist/buscar/c/$control',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final assistData = new Assists.fromJsonList(decodedData['assist']);
    //final dt = assistData.items;
    print('decode:{$decodedData}');
    return assistData.items;
  }

Future <List<Assist>> buscarAssistbyPerson(String person) async{
    final url = Uri.https(_url, '/assist/buscar/p/$person',{
      'token' : _prefs.token
    } );
 
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if ( decodedData == null ) return [];
    if ( decodedData['error'] != null ) return []; //EXTRA CUANDO EL TOKEN SE VENCE

    final assistData = new Assists.fromJsonList(decodedData['assist']);
    //final dt = assistData.items;
    print('decode:{$decodedData}');
    return assistData.items;
  } 
  Future<Map<String, dynamic>> nuevoAssist(String assistcontrol, String person, String date_time  ) async {

    Map<String, dynamic>  authData = {'assistcontrol': assistcontrol,'person' : person,'date_time':date_time };
    final url = '$_url2/assist';
    final resp = await http.post(url,body:  authData); 

    Map<String, dynamic> decodedResp = json.decode( resp.body );

    print('decodedResp: $decodedResp');
    //print('ok: ${decodedResp['ok']}'); 
    //print('person: ${decodedResp['assist']}'); 

    if ( decodedResp.containsKey('person') ) {
      return { 'ok': true, 'assist': ' ${decodedResp['assist']}'  }; 
    } else {  
      return { 'ok': false, 'mensaje': ' ${decodedResp['err']}'  };
    }
  }

   // Editar - PUT

  Future<bool> editarFeedback( Assist item ) async {
    
    final url = Uri.https(_url, 'activity/${item.id}',{
      'token' : _prefs.token
    } );

    final resp = await http.post( url, body: assistToJson(item) );
    final decodedData = json.decode(resp.body);
    print( 'editarFeedback: $decodedData');
    return true;

  }

Future<int> borrarAssist( String id ) async { 

    final url  = '$_url/assist/$id';
    final resp = await http.delete(url);

    print( resp.body );

    return 1;
  } 
}
