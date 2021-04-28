import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel {
  String name;
  String description;
  DateTime eventDate;
  UserModel();
  factory UserModel.fromJson(json) => _$UserModelFromJson(json);
}