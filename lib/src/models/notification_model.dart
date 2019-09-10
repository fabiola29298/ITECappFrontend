// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Notification clientFromJson(String str) => Notification.fromJson(json.decode(str));

String clientToJson(Notification data) => json.encode(data.toJson());

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
