// To parse this JSON data, do
//
//     final author = authorFromJson(jsonString);

import 'dart:convert';

Author authorFromJson(String str) => Author.fromJson(json.decode(str));

String authorToJson(Author data) => json.encode(data.toJson());

class Author {
  String name;
  String bio;
  String image;

  Author({
    required this.name,
    required this.bio,
    required this.image,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json["name"],
    bio: json["bio"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "bio": bio,
    "image": image,
  };
}
