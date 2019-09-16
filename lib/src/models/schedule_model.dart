// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';
 

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());
class Schedules{
  //contenedor de todos los items
  //MAPEO
  List<Schedule> items = new List();

  Schedules.fromJsonList( List<dynamic> jsonList){

    if (jsonList == null) return;

    jsonList.forEach( (item) {
      final activity = Schedule.fromJsonMap(item); 
      items.add(activity);
    });
  }


  // recibir el mapa de todo
}
class Schedule {
    bool status;
    String id;
    Map<String, dynamic> activity;
    String person;
    int v;

    Schedule({
        this.status,
        this.id,
        this.activity,
        this.person,
        this.v,
    });
    Schedule.fromJsonMap(Map<String, dynamic> json) {
        status   = json["status"];
        id       = json["_id"]; 
        activity = json["activity"];
        person   = json["person"];
        v        = json["__v"];
    }
    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        status: json["status"],
        id: json["_id"],
        activity: json["activity"],
        person: json["person"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "activity": activity,
        "person": person,
        "__v": v,
    };
}
