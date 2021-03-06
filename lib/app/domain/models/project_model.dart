// To parse this JSON data, do
//
//     final projects = projectsFromMap(jsonString);

import 'dart:convert';

class Projects {
  Projects({
    required this.category,
    required this.contact,
    this.country,
    required this.decription,
    required this.image,
    required this.name,
    this.web,
    this.id,
    this.email,
    this.user,
    this.atribution,
  });

  String category;
  String contact;
  String? country;
  String decription;
  String image;
  String name;
  String? web;
  String? id;
  String? email;
  String? user;
  String? atribution;

  factory Projects.fromJson(String str) => Projects.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Projects.fromMap(Map<String, dynamic> json) => Projects(
      category: json["category"],
      contact: json["contact"],
      country: json["country"],
      decription: json["decription"],
      image: json["image"],
      name: json["name"],
      web: json["web"],
      email: json["email"],
      user: json["user"],
      atribution: json["atribution"]);

  Map<String, dynamic> toMap() => {
        "category": category,
        "contact": contact,
        "country": country,
        "decription": decription,
        "image": image,
        "name": name,
        "web": web,
        "email": email,
        "user": user,
        "atribution": atribution,
      };

  Projects copy() => Projects(
        id: this.id,
        category: this.category,
        contact: this.contact,
        country: this.country,
        decription: this.decription,
        image: this.image,
        name: this.name,
        web: this.web,
        email: this.email,
        user: this.user,
        atribution: this.atribution,
      );
}
