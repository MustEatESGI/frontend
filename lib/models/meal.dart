import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';


@JsonSerializable()
class Meal {
  String? id, name;
  double? price;

  Meal({this.id, this.name, this.price});

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);
  Map<String, dynamic> toJson() => _$MealToJson(this);
}