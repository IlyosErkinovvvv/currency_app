import 'package:dio/dio.dart';

class DioCatchError {
  static String catchError(DioError e){
    switch (e.type) {
      case DioErrorType.connectionTimeout:
        return "Connection time out";
      case DioErrorType.sendTimeout:
        return "Send time out";
      case DioErrorType.receiveTimeout:
        return "Receive time out";
      case DioErrorType.unknown:
        return "No internet connection";
      default:
        return "Something went wrong";
    }
  }
}