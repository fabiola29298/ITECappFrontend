// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';


Notification scheduleFromJson(String str) => Notification.fromJson(json.decode(str));

String scheduleToJson(Notification data) => json.encode(data.toJson());

class Notifications{
  //contenedor de todos los items
  //MAPEO
  List<Notification> items = new List();

  Notifications.fromJsonList( List<dynamic> jsonList){

    if (jsonList == null) return;

    jsonList.forEach( (item) {
      final notificationItem = Notification.fromJsonMap(item); 
      items.add(notificationItem);
    });
  }


  // recibir el mapa de todo
}
class Notification {
    bool status;
    String id;
    String name;
    String description;
    String urlImage;
    String urlExtra;
    DateTime dateTime;
    int v;

    Notification({
        this.status,
        this.id,
        this.name,
        this.description,
        this.urlImage,
        this.urlExtra,
        this.dateTime,
        this.v,
    });
    Notification.fromJsonMap(Map<String, dynamic> json) {
        status        = json["status"];
        id            = json["_id"]; 
        name          = json["name"];
        description   = json["description"];
        urlImage      = json["urlImage"];
        urlExtra      = json["urlExtra"]; 
        dateTime      = json["dateTime"];
        v             = json["__v"];
    }
    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        status: json["status"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        urlImage: json["url_image"],
        urlExtra: json["url_extra"],
        dateTime: DateTime.parse(json["date_time"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "name": name,
        "description": description,
        "url_image": urlImage,
        "url_extra": urlExtra,
        "date_time": dateTime.toIso8601String(),
        "__v": v,
    };
}
