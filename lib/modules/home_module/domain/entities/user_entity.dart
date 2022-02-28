import 'dart:convert';

import 'package:before_start/modules/home_module/data/models/user_model.dart';

class UserEntity {
  final String objectId;
  final String username;
  final String email;
  final bool emailVerified;
  final String sessionToken;

  UserEntity({
    required this.objectId,
    required this.username,
    required this.email,
    required this.emailVerified,
    required this.sessionToken,
  });

  UserEntity copyWith({
    String? objectId,
    String? username,
    String? email,
    bool? emailVerified,
    String? sessionToken,
  }) {
    return UserEntity(
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

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      objectId: map['objectId'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      emailVerified: map['emailVerified'] ?? false,
      sessionToken: map['sessionToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  toUserModel() => UserModel(
        objectId: objectId,
        username: username,
        email: email,
        emailVerified: emailVerified,
        sessionToken: sessionToken,
      );

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEntity(objectId: $objectId, username: $username, email: $email, emailVerified: $emailVerified, sessionToken: $sessionToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserEntity &&
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
