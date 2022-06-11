// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credentials _$CredentialsFromJson(Map<String, dynamic> json) => Credentials(
      json['access_token'] as String?,
      json['refresh_token'] as String?,
    );

Map<String, dynamic> _$CredentialsToJson(Credentials instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
    };
