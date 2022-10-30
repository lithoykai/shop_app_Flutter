class HttpException implements Exception {
  final String msg;
  int statusCode;

  HttpException({required this.msg, required this.statusCode});

  @override
  String toString() {
    return msg;
  }
}
