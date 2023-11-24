import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Details{

  late String _name;
  late String _age;


  Details(this._name, this._age);

  String get name => _name;
  set name(String value) => _name = value;



  String get age => _age;
  set age(String value) => _age = value;

}