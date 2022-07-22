
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location{
  num? id;
  double? latitude, longitude;
  String? address;

  Location({this.id, this.latitude, this.longitude, this.address});

  factory Location.fromAddress({required String address}) => Location(address: address);

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
