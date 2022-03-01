import 'dart:convert';

import '../../data/models/new_user_data_model.dart';

class NewUserDataEntity {
  final String username;
  final String email;
  final String password;

  NewUserDataEntity({
    required this.username,
    required this.email,
    required this.password,
  });

  NewUserDataEntity copyWith({
    String? username,
    String? email,
    String? telefone,
    String? password,
  }) {
    return NewUserDataEntity(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'email': email});
    result.addAll({'password': password});

    return result;
  }

  factory NewUserDataEntity.fromMap(Map<String, dynamic> map) {
    return NewUserDataEntity(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  toNewUserDataModel() => NewUserDataModel(
        username: username,
        email: email,
        password: password,
      );

  factory NewUserDataEntity.fromJson(String source) => NewUserDataEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterUserEntity(username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewUserDataEntity && other.username == username && other.email == email && other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
