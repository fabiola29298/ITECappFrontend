import 'dart:async';
import 'package:itec_app/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class SigninBloc with Validators {


  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameController     = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  // Recuperar los datos del Stream
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
  Stream<String> get nameStream    => _nameController.stream;
  Stream<String> get lastnameStream => _lastnameController.stream;

   Stream <bool> get fromValidStram =>
          Observable.combineLatest4(emailStream, passwordStream, nameStream, lastnameStream, (e,p,n,l)=> true);

  // Insertar valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeName    => _nameController.sink.add;
  Function(String) get changeLastname => _lastnameController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  String get name     => _nameController.value;
  String get lastname => _lastnameController.value;
  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nameController?.close();
    _lastnameController?.close();
  }

}

