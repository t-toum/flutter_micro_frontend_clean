abstract class CustomException implements Exception {
  final String message;
  CustomException(this.message);
}

class ServerException extends CustomException {
  ServerException(super.message);
}

class CacheException extends CustomException {
  CacheException(super.message);
}