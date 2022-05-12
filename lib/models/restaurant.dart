
import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/location.dart';
part 'restaurant.g.dart';


@JsonSerializable()
class Restaurant{
  String? id, name, imageUrl;
  String? distance;
  List<String>? mealIds;

  Restaurant({this.id, this.name, this.distance, this.mealIds, this.imageUrl});

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}