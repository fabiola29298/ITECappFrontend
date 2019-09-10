// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Sponsor clientFromJson(String str) => Sponsor.fromJson(json.decode(str));

String clientToJson(Sponsor data) => json.encode(data.toJson());

class Sponsor {
    bool status;
    String id;
    String name;
    String description;
    String urlWebsite;
    String urlImage;
    int v;

    Sponsor({
        this.status,
        this.id,
        this.name,
        this.description,
        this.urlWebsite,
        this.urlImage,
        this.v,
    });

    factory Sponsor.fromJson(Map<String, dynamic> json) => Sponsor(
        status: json["status"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        urlWebsite: json["url_website"],
        urlImage: json["url_image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "_id": id,
        "name": name,
        "description": description,
        "url_website": urlWebsite,
        "url_image": urlImage,
        "__v": v,
    };
}
