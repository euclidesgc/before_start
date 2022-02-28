import 'dart:convert';

import 'package:before_start/modules/home_module/domain/entities/user_entity.dart';

class UserModel {
  final String objectId;
  final String username;
  final String email;
  final bool emailVerified;
  final String sessionToken;

  UserModel({
    required this.objectId,
    required this.username,
    required this.email,
    required this.emailVerified,
    required this.sessionToken,
  });

  UserModel copyWith({
    String? objectId,
    String? username,
    String? email,
    bool? emailVerified,
    String? sessionToken,
  }) {
    return UserModel(
      objectId: objectId ?? this.objectId,
      username: username ?? this.username,
      email: email ?? this.email,
      emailVerified: emailVerified ?? this.emailVerified,
      sessionToken: sessionToken ?? this.sessionToken,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'objectId': objectId});
    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'emailVerified': emailVerified});
    result.addAll({'sessionToken': sessionToken});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      objectId: map['objectId'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      emailVerified: map['emailVerified'] ?? false,
      sessionToken: map['sessionToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  toUserEntity() => UserEntity(
        objectId: objectId,
        username: username,
        email: email,
        emailVerified: emailVerified,
        sessionToken: sessionToken,
      );

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(objectId: $objectId, username: $username, email: $email, emailVerified: $emailVerified, sessionToken: $sessionToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.objectId == objectId &&
        other.username == username &&
        other.email == email &&
        other.emailVerified == emailVerified &&
        other.sessionToken == sessionToken;
  }

  @override
  int get hashCode {
    return objectId.hashCode ^ username.hashCode ^ email.hashCode ^ emailVerified.hashCode ^ sessionToken.hashCode;
  }
}
