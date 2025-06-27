import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/constants/api_keys.dart';
import 'package:news_app/core/utils/exceptions/dio_exceptions.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';

@singleton
class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org/v2",
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      queryParameters: {"apiKey": ApiKeys.newsApi},
    ),
  );

  // GET Request
  Future<Either<Failure, Response>> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return right(response);
    } catch (error) {
      return left(DioExceptions.handleError(error));
    }
  }
}
