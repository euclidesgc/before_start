import 'dart:convert';

import 'package:before_start/modules/home_module/domain/entities/registered_user_entity.dart';

class RegisteredUserModel {
  final String objectId;
  final String createdAt;

  RegisteredUserModel({
    required this.objectId,
    required this.createdAt,
  });

  RegisteredUserModel copyWith({
    String? objectId,
    String? createdAt,
  }) {
    return RegisteredUserModel(
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

  //
  factory RegisteredUserModel.fromMap(Map<String, dynamic> map) {
    return RegisteredUserModel(
      objectId: map['objectId'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  toRegisteredUserEntity() => RegisteredUserEntity(objectId: objectId, createdAt: createdAt);

  factory RegisteredUserModel.fromJson(String source) => RegisteredUserModel.fromMap(json.decode(source));

  @override
  String toString() => 'RegisteredUserModel(objectId: $objectId, createdAt: $createdAt)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisteredUserModel && other.objectId == objectId && other.createdAt == createdAt;
  }

  @override
  int get hashCode => objectId.hashCode ^ createdAt.hashCode;
}
