// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Schedule clientFromJson(String str) => Schedule.fromJson(json.decode(str));

String clientToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
    bool status;
    String id;
    String activity;
    String person;
    int v;

    Schedule({
        this.status,
        this.id,
        this.activity,
        this.person,
        this.v,
    });

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
