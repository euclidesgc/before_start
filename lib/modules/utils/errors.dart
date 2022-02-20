abstract class Failure implements Exception {}

class ConnectionError extends Failure {
  final String? message;
  ConnectionError({this.message});
}

class LoginError extends Failure {
  final String? message;
  LoginError({this.message});
}
