

// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Assist assistFromJson(String str) => Assist.fromJson(json.decode(str));

String assistToJson(Assist data) => json.encode(data.toJson());

class Assists{
  //contenedor de todos los items
  //MAPEO
  List<Assist> items = new List();

  Assists.fromJsonList( List<dynamic> jsonList){

    if (jsonList == null) return;

    jsonList.forEach( (item) {
      final activity = Assist.fromJsonMap(item); 
      items.add(activity);
    });
  }

}

class Assist {
    String feedback;
    bool status;
    String id;
    String assistcontrol;
    String person;
    DateTime dateTime;
    int v;

    Assist({
        this.feedback,
        this.status,
        this.id,
        this.assistcontrol,
        this.person,
        this.dateTime,
        this.v,
    });

    factory Assist.fromJson(Map<String, dynamic> json) => Assist(
        feedback: json["feedback"],
        status: json["status"],
        id: json["_id"],
        assistcontrol: json["assistcontrol"],
        person: json["person"],
        dateTime: DateTime.parse(json["date_time"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "feedback": feedback,
        "status": status,
        "_id": id,
        "assistcontrol": assistcontrol,
        "person": person,
        "date_time": dateTime.toIso8601String(),
        "__v": v,
    };

       Assist.fromJsonMap(Map<String,dynamic> json){
        feedback     = json['feedback'];
        status       = json['status'];
        id           = json['_id']; 
        assistcontrol    = json["assistcontrol"];
        person       = json['person'];   
        dateTime = json["date_time"];
        v            = json['v']; 
    
  }
}
