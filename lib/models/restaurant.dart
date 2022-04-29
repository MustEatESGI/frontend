
import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/location.dart';
part 'restaurant.g.dart';


@JsonSerializable()
class Restaurant{
  String? id, name;
  int? rayon;
  Location? location;
  List<String>? mealIds;

  Restaurant({this.id, this.name, this.rayon, this.location, this.mealIds});

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}