import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:
  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    prefs.initPrefs();
*/

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de token
 
  get token {
    return _prefs.getString('token') ?? '';
  }

  set token( String value ) {
    _prefs.setString('token', value);
  }
  
  // GET y SET de token
 
  get typeUSer {
    return _prefs.getString('typeUSer') ?? '';
  }

  set typeUSer( String value ) {
    _prefs.setString('typeUSer', value);
  }

  // GET y SET de la última página
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'menuPage';
  }

  set ultimaPagina( String value ) {
    _prefs.setString('ultimaPagina', value);
  }

  // GET y SET de la ID
  get idpref {
    return _prefs.getString('idpref') ?? '';
  }

  set idpref( String value ) {
    _prefs.setString('idpref', value);
  }

}
