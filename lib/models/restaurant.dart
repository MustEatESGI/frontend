
import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/location.dart';
import 'package:must_eat_gui/models/meal.dart';
part 'restaurant.g.dart';


@JsonSerializable()
class Restaurant{
  int? id;
  String? name, imageUrl;
  String? distance;
  List<Meal>? meals;
  Location? location;

  Restaurant({this.id, this.name, this.distance, this.meals, this.imageUrl, this.location});

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
