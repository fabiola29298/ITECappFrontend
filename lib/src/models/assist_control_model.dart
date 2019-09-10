// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Control clientFromJson(String str) => Control.fromJson(json.decode(str));

String clientToJson(Control data) => json.encode(data.toJson());

class Control {
    bool status;
    String id;
    String activity;
    String person;
    String nameStaff;
    String nameActivity;
    int v;

    Control({
        this.status,
        this.id,
        this.activity,
        this.person,
        this.nameStaff,
        this.nameActivity,
        this.v,
    });

    factory Control.fromJson(Map<String, dynamic> json) => Control(
        status: json["status"],
        id: json["_id"],
        activity: json["activity"],
        person: json["person"],
        nameStaff: json["name_staff"],
        nameActivity: json["name_activity"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "activity": activity,
        "person": person,
        "name_staff": nameStaff,
        "name_activity": nameActivity,
        "__v": v,
    };
}