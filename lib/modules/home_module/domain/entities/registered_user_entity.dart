import 'dart:convert';

import 'package:before_start/modules/home_module/data/models/registered_user_model.dart';

class RegisteredUserEntity {
  final String objectId;
  final String createdAt;

  RegisteredUserEntity({
    required this.objectId,
    required this.createdAt,
  });

  RegisteredUserEntity copyWith({
    String? objectId,
    String? createdAt,
  }) {
    return RegisteredUserEntity(
      objectId: objectId ?? this.objectId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'objectId': objectId});
    result.addAll({'createdAt': createdAt});

    return result;
  }

  factory RegisteredUserEntity.fromMap(Map<String, dynamic> map) {
    return RegisteredUserEntity(
      objectId: map['objectId'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  toRegisteredUserModel() => RegisteredUserModel(objectId: objectId, createdAt: createdAt);

  factory RegisteredUserEntity.fromJson(String source) => RegisteredUserEntity.fromMap(json.decode(source));

  @override
  String toString() => 'RegisteredUserEntity(objectId: $objectId, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisteredUserEntity && other.objectId == objectId && other.createdAt == createdAt;
  }

  @override
  int get hashCode => objectId.hashCode ^ createdAt.hashCode;
}
