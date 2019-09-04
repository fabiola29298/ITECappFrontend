// Generated by https://quicktype.io
class Activities{
  //contenedor de todas las peliculas que estoy manejando
  //MAPEO
  List<Activity> items = new List();

  Activities.fromJsonList( List<dynamic> jsonList){

    if (jsonList == null) return;

    jsonList.forEach( (item) {
      final activity = Activity.fromJsonMap(item); 
      items.add(activity);
    });
  }


  // recibir el mapa de todo
}
class Activity {
  String id;
  String speakerId;
  bool status;
  String name;
  String type;
  String date;
  String description;
  String startTime;
  String endTime;
  String classroom;
  String blockCampus;
  int v;

  Activity({
    this.id,
    this.speakerId,
    this.status,
    this.name,
    this.type,
    this.date,
    this.description,
    this.startTime,
    this.endTime,
    this.classroom,
    this.blockCampus,
    this.v,
  });


  Activity.fromJsonMap(Map<String,dynamic> json){
    id= json['id']; 
    speakerId= json['speaker_id']; 
    status= json['status']; 
    name= json['name']; 
    type= json['type']; 
    date= json['date']; 
    description= json['description']; 
    startTime= json['start_time']; 
    endTime= json['end_time']; 
    classroom= json['classroom']; 
    blockCampus= json['block_campus']; 
    v= json['v']; 

    
  }
}
