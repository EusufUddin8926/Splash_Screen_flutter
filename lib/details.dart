import 'dart:convert';

Details DetailsFromJson(String str) => Details.fromJson(json.decode(str));

String DetailsToJson(Details data) => json.encode(data.toJson());

class Details {
  final String? name;
  final String? age;

  Details({
    this.name,
    this.age,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    name: json["name"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
  };
}
