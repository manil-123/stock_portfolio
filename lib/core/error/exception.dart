class ServerException implements Exception {
  String exceptionMessage;
  ServerException(this.exceptionMessage);
}

class CacheException implements Exception {
  String exceptionMessage;
  CacheException(this.exceptionMessage);
}

class CustomFormatException implements Exception {
  String exceptionMessage;
  CustomFormatException(this.exceptionMessage);
}
