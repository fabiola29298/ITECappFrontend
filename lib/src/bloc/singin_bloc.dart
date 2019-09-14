import 'dart:async';
import 'package:itec_app/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class SigninBloc with Validators {


  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nameController     = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _genderController   = BehaviorSubject<String>();
  final _careerController   = BehaviorSubject<String>();
  final _typeController     = BehaviorSubject<String>();
  // Recuperar los datos del Stream
  Stream<String> get emailStream     => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream  => _passwordController.stream.transform( validarPassword );
  Stream<String> get nameStream      => _nameController.stream;
  Stream<String> get lastnameStream  => _lastnameController.stream;
  Stream<String> get genderStream    => _genderController.stream;
  Stream<String> get careerStream    => _careerController.stream; 
  Stream<String> get typeStream       => _typeController.stream; 
    
   Stream <bool> get fromValidStram =>
          Observable.combineLatest7(emailStream, passwordStream, nameStream, lastnameStream, genderStream, careerStream, typeStream ,(e,p,n,l,g,c,t)=> true);

  // Insertar valores al Stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeName     => _nameController.sink.add;
  Function(String) get changeLastname => _lastnameController.sink.add;
  Function(String) get changeGender   => _genderController.sink.add;
  Function(String) get changeCareer   => _careerController.sink.add;
  Function(String) get changeType     => _typeController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get email    => _emailController.value;
  String get password => _passwordController.value;
  String get name     => _nameController.value;
  String get lastname => _lastnameController.value;
  String get gender   => _genderController.value;
  String get career   => _careerController.value;
  String get type     => _typeController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nameController?.close();
    _lastnameController?.close();
    _genderController?.close();
    _careerController?.close();
    _typeController?.close();
  }

}

