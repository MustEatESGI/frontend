import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/location.dart';

part 'user.g.dart';


@JsonSerializable()
class User{
  String? id, username, password;
  Location? location;
  User({this.id, this.username, this.password, this.location});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}



