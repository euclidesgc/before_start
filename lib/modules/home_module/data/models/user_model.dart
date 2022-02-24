import 'dart:convert';

import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  final String objectId;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool emailVerified;
  final String sessionToken;

  UserModel({
    required this.objectId,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerified,
    required this.sessionToken,
  });

  UserModel copyWith({
    String? objectId,
    String? username,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? emailVerified,
    String? sessionToken,
  }) =>
      UserModel(
        objectId: objectId ?? this.objectId,
        username: username ?? this.username,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        emailVerified: emailVerified ?? this.emailVerified,
        sessionToken: sessionToken ?? this.sessionToken,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        objectId: json["objectId"],
        username: json["username"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        emailVerified: json["emailVerified"],
        sessionToken: json["sessionToken"],
      );

  UserEntity toUserEntity() => UserEntity(
        objectId: objectId,
        username: username,
        createdAt: createdAt,
        updatedAt: updatedAt,
        emailVerified: emailVerified,
        sessionToken: sessionToken,
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "username": username,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "emailVerified": emailVerified,
        "sessionToken": sessionToken,
      };
}
