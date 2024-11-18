import 'package:base_app/src/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.company,
    required super.username,
    required super.email,
    required super.address,
    required super.zip,
    required super.state,
    required super.country,
    required super.phone,
    required super.photo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String,dynamic> toJson() => _$UserModelToJson(this);
}
