import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';

@JsonSerializable()
class Users {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? status;

  Users({this.id, this.name, this.email, this.gender, this.status});

  factory Users.fromJson(Map<String, dynamic> json) =>
      _$UsersFromJson(json); // from json to object

  Map<String, dynamic> toJson() => _$UsersToJson(this); // from object to json
}
