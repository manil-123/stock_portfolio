import 'package:share_portfolio/core/constants/string_constants.dart';

class ServerException implements Exception {
  String exceptionMessage;
  ServerException(this.exceptionMessage);
}

class CacheException implements Exception {
  String exceptionMessage;
  CacheException(this.exceptionMessage);
}

class NoInternetException implements Exception {
  final message = ErrorMsg.noInternetConnection;
  const NoInternetException();
}

class ScrapException implements Exception {
  String exceptionMessage;
  ScrapException(this.exceptionMessage);
}
