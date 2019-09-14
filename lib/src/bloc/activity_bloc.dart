import 'dart:async'; 
import 'package:rxdart/rxdart.dart';

class ActivityBloc   {


  final _personController      = BehaviorSubject<String>();
  final _nameController        = BehaviorSubject<String>();
  final _typeController        = BehaviorSubject<String>();
  final _dateController        = BehaviorSubject<String>();
  final _descriptionController = BehaviorSubject<String>();
  final _starttimeController   = BehaviorSubject<String>();
  final _endtimeController     = BehaviorSubject<String>();
  final _classroomController   = BehaviorSubject<String>();
  final _blockController       = BehaviorSubject<String>();
  // Recuperar los datos del Stream
  Stream<String> get personStream      => _personController.stream;
  Stream<String> get nameStream        => _nameController.stream;
  Stream<String> get typeStream        => _typeController.stream;
  Stream<String> get dateStream        => _dateController.stream;
  Stream<String> get descriptionStream => _descriptionController.stream;
  Stream<String> get starttimeStream   => _starttimeController.stream; 
  Stream<String> get endtimeStream     => _endtimeController.stream; 
  Stream<String> get classroomStream   => _classroomController.stream; 
  Stream<String> get blockStream       => _blockController.stream; 

   Stream <bool> get fromValidStram =>
          Observable.combineLatest9(personStream, nameStream, typeStream, dateStream, descriptionStream, starttimeStream, endtimeStream , classroomStream , blockStream ,(e,p,n,l,g,c,t, cr,bl)=> true);

  // Insertar valores al Stream
  Function(String) get changePerson         => _personController.sink.add;
  Function(String) get changeName           => _nameController.sink.add;
  Function(String) get changeType           => _typeController.sink.add;
  Function(String) get changeDate           => _dateController.sink.add;
  Function(String) get changeDescription    => _descriptionController.sink.add;
  Function(String) get changeStarttime      => _starttimeController.sink.add;
  Function(String) get changeEndtime        => _endtimeController.sink.add;
  Function(String) get changeClassroom      => _classroomController.sink.add;
  Function(String) get changeBlock          => _blockController.sink.add;

  // Obtener el último valor ingresado a los streams
  String get person        => _personController.value;
  String get name          => _nameController.value;
  String get type          => _typeController.value;
  String get date          => _dateController.value;
  String get description   => _descriptionController.value;
  String get starttime     => _starttimeController.value;
  String get endtime       => _endtimeController.value;
  String get classroom     => _classroomController.value;
  String get block         => _blockController.value;

  dispose() {
    _personController?.close();
    _nameController?.close();
    _typeController?.close();
    _dateController?.close();
    _descriptionController?.close();
    _starttimeController?.close();
    _endtimeController?.close();
    _classroomController?.close();
    _blockController?.close();
  }

}
