import 'dart:convert';

import '../../data/models/user_model.dart';

UserEntity userEntityFromJson(String str) => UserEntity.fromJson(json.decode(str));

String userEntityToJson(UserEntity data) => json.encode(data.toJson());

class UserEntity {
  final String objectId;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool emailVerified;
  final String sessionToken;

  UserEntity({
    required this.objectId,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
    required this.emailVerified,
    required this.sessionToken,
  });

  UserEntity copyWith({
    String? objectId,
    String? username,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? emailVerified,
    String? sessionToken,
  }) =>
      UserEntity(
        objectId: objectId ?? this.objectId,
        username: username ?? this.username,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        emailVerified: emailVerified ?? this.emailVerified,
        sessionToken: sessionToken ?? this.sessionToken,
      );

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        objectId: json["objectId"],
        username: json["username"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        emailVerified: json["emailVerified"],
        sessionToken: json["sessionToken"],
      );

  toUserModel() => UserModel(
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

  @override
  String toString() {
    return 'UserEntity(objectId: $objectId, username: $username, createdAt: $createdAt, updatedAt: $updatedAt, emailVerified: $emailVerified, sessionToken: $sessionToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
        other.objectId == objectId &&
        other.username == username &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.emailVerified == emailVerified &&
        other.sessionToken == sessionToken;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^ username.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ emailVerified.hashCode ^ sessionToken.hashCode;
  }
}
