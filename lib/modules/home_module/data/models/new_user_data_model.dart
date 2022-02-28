import 'dart:convert';

class NewUserDataModel {
  final String username;
  final String email;
  final String password;

  NewUserDataModel({
    required this.username,
    required this.email,
    required this.password,
  });

  NewUserDataModel copyWith({
    String? username,
    String? email,
    String? telefone,
    String? password,
  }) {
    return NewUserDataModel(
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

  factory NewUserDataModel.fromMap(Map<String, dynamic> map) {
    return NewUserDataModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory NewUserDataModel.fromJson(String source) => NewUserDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterUserEntity(username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewUserDataModel && other.username == username && other.email == email && other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
