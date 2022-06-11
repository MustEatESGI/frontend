import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/location.dart';

part 'credentials.g.dart';


@JsonSerializable()
class Credentials{
  String? access_token, refresh_token;

  Credentials(this.access_token, this.refresh_token);

  factory Credentials.fromJson(Map<String, dynamic> json) => _$CredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsToJson(this);
}



