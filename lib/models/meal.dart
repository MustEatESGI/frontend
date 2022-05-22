import 'package:json_annotation/json_annotation.dart';
import 'package:must_eat_gui/models/restaurant.dart';

part 'meal.g.dart';


@JsonSerializable()
class Meal {
  String? id, name, imageUrl;
  double? price;
  Restaurant? restaurant;

  Meal({this.id, this.name, this.price, this.imageUrl, this.restaurant});

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}