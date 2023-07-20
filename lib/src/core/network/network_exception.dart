// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

/// It takes a DioError object and returns a custom error message
class NetworkExceptions extends Equatable implements Exception {
  NetworkExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioError.stackTrace.toString().contains('SocketException')) {
          message = 'No Internet';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        // message = ErrorModel.fromJson(dioError.response?.data as Map<String, dynamic>).statusMessage!;
        break;

      case DioExceptionType.unknown:
        if (dioError.error.toString().contains('SocketException')) {
          message = 'No Internet';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }
    }
  }

  late String message;

  @override
  List<Object> get props => [message];
}
