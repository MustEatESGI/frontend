import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/restaurant.dart';

part 'meal.g.dart';


@JsonSerializable()
class Meal {
  int? id, restaurantId;
  String? name, picture;
  double? price;
  Restaurant? restaurant;

  Meal({this.id, this.name, this.price, this.picture, this.restaurant, this.restaurantId});

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}