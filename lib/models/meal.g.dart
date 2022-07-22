// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      picture: json['picture'] as String?,
      restaurant: json['restaurant'] == null
          ? null
          : Restaurant.fromJson(json['restaurant'] as Map<String, dynamic>),
      restaurantId: json['restaurantId'] as int?,
      distance: json['distance'] as int?,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'distance': instance.distance,
      'name': instance.name,
      'picture': instance.picture,
      'price': instance.price,
      'restaurant': instance.restaurant,
    };
