// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel()
    ..name = json['name'] as String
    ..lastName = json['lastName'] as String
    ..description = json['description'] as String
    ..eventDate = json['eventDate'] == null
        ? null
        : DateTime.parse(json['eventDate'] as String);
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'lastName': instance.lastName,
      'description': instance.description,
      'eventDate': instance.eventDate?.toIso8601String(),
    };
