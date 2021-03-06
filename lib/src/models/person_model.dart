// Generated by https://quicktype.io

import 'dart:convert';

Person activityModelFromJson(String str) => Person.fromJson(json.decode(str));

String activityModelToJson(Person data) => json.encode(data.toJson());

class People{
  //contenedor de todos los items
  //MAPEO
  List<Person> items = new List();

  People.fromJsonList( List<dynamic> jsonList){

    if (jsonList == null) return;

    jsonList.forEach( (item) {
      final activity = Person.fromJsonMap(item); 
      items.add(activity);
    });
  }


  // recibir el mapa de todo
}
class Person {
  String role;
  bool status;
  bool google;
  String id;
  String name;
  String lastName;
  String email;
  String degree;
  String password;
  String description;
  String urlImage;
  String typeInscription;
  String career;
  String gender;
  int v;

  Person({
    this.role,
    this.status,
    this.google,
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.degree,
    this.password,
    this.description,
    this.urlImage,
    this.typeInscription,
    this.career,
    this.gender,
    this.v,
  });
  Person.fromJsonMap(Map<String,dynamic> json){
        role= json["role"];
        status= json["status"];
        google= json["google"];
        id= json["_id"];
        name= json["name"];
        lastName= json["last_name"];
        email= json["email"];
        degree= json["degree"];
        password= json["password"];
        description= json["description"];
        urlImage= json["url_image"];
        typeInscription= json["type_inscription"];
        career= json["career"];
        gender= json["gender"];
        v= json["__v"];

    
  }
  factory Person.fromJson(Map<String, dynamic> json) => Person(
        role: json["role"],
        status: json["status"],
        google: json["google"],
        id: json["_id"],
        name: json["name"],
        lastName: json["last_name"],
        email: json["email"],
        degree: json["degree"],
        password: json["password"],
        description: json["description"],
        urlImage: json["url_image"],
        typeInscription: json["type_inscription"],
        career: json["career"],
        gender: json["gender"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "role": role,
        "status": status,
        "google": google,
        "_id": id,
        "name": name,
        "last_name": lastName,
        "email": email,
        "degree": degree,
        "password": password,
        "description": description,
        "url_image": urlImage,
        "type_inscription": typeInscription,
        "career": career,
        "gender": gender,
        "__v": v,
    };
}
