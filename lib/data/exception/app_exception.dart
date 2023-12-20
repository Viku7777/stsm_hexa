class AppException implements Exception {
  String? message;
  String? prefix;
  AppException({this.message, this.prefix});

  tostring() {
    return "$prefix$message";
  }
}

class TimeException extends AppException {
  TimeException([String? message])
      : super(message: message, prefix: "Request Time out");
}

class InternetException extends AppException {
  InternetException([String? message])
      : super(message: message, prefix: "No Internet Connection");
}

class OtherException extends AppException {
  OtherException(String message) : super(message: "", prefix: message);
}
