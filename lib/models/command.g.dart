// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Command _$CommandFromJson(Map<String, dynamic> json) => Command(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      restaurantId: json['restaurantId'] as String?,
      mealIds: json['mealIds'] as String?,
    );

Map<String, dynamic> _$CommandToJson(Command instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'restaurantId': instance.restaurantId,
      'mealIds': instance.mealIds,
    };
