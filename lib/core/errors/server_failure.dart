



import 'package:dio/dio.dart';

class Failure{
  final String errorMessage;

  Failure(this.errorMessage);
}
class ServerFailure extends Failure{
  ServerFailure(String errorMessage) : super(errorMessage);

  factory ServerFailure.fromDioError(DioException dioError){
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with Api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with Api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with Api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to Api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet Connection ');
      case DioExceptionType.unknown:
        return ServerFailure('Oops there was an error, please try later!');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400) {
      return ServerFailure('Your request was not found, please try later');
    }
     else if (statusCode == 401) {
        return ServerFailure('Un authorized request, please try later');
    }
    else if (statusCode == 402) {
      return ServerFailure('Request failed, please try later');
    }else if (statusCode == 403) {
      return ServerFailure('Forbidden request, please try later');
    }else if (statusCode == 409) {
      return ServerFailure('The request conflicts with another request, please try later');
    }else if (statusCode == 429) {
      return ServerFailure('Too many requests hit the API too quickly. We recommend an exponential backoff of your requests.');
    }else if (statusCode == 500 || statusCode == 502 || statusCode == 503 || statusCode == 504) {
      return ServerFailure('	Something went wrong on Stripe’s end.');

    } else {

      return ServerFailure(response['error']['message']);

    }
  }
}