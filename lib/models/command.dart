import 'package:json_annotation/json_annotation.dart';

part 'command.g.dart';


@JsonSerializable()
class Command{
  String? id, userId, restaurantId;
  List<String>? mealIds;

  Command({this.id, this.userId, this.restaurantId, this.mealIds});

  factory Command.fromJson(Map<String, dynamic> json) => _$CommandFromJson(json);
  Map<String, dynamic> toJson() => _$CommandToJson(this);
}