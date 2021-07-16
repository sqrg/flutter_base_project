class ApiException implements Exception {
  String? message;
  String? prefix;

  ApiException([this.message, this.prefix]);

  String toString() {
    return '$prefix: $message';
  }
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, 'Invalid request');
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([message]) : super(message, 'Unauthorized');
}

class NotAllowedException extends ApiException {
  NotAllowedException([message]) : super(message, 'Not allowed');
}

class ValidationException extends ApiException {
  Map<String, dynamic>? errors;

  ValidationException([message, this.errors]) : super(message, 'Validation errors');

  ValidationException.fromJson(Map<String, dynamic> json) {
    prefix = 'Validation errors';
    message = json['message'];
    errors = json['errors'];
  }
}
