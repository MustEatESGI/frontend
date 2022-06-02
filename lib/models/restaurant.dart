
import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/location.dart';
import 'package:must_eat_gui/models/meal.dart';
part 'restaurant.g.dart';


@JsonSerializable()
class Restaurant{
  String? id, name, imageUrl;
  String? distance;
  List<Meal>? meals;

  Restaurant({this.id, this.name, this.distance, this.meals, this.imageUrl});

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}