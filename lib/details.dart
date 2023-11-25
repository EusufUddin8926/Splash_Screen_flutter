import 'dart:convert';

Details DetailsFromJson(String str) => Details.fromJson(json.decode(str));

String DetailsToJson(Details data) => json.encode(data.toJson());

class Details {
  late String name;
  late String age;

  Details({required this.name, required this.age});

  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
      name: map['name'] as String,
      age: map['age'] as String,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Details.fromJson(String json) => Details.fromMap(jsonDecode(json));
}
