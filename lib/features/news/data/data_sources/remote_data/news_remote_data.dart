import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/core/constants/app_text.dart';
import 'package:news_app/core/exceptions/dio_exceptions.dart';
import 'package:news_app/core/exceptions/failure.dart';
import 'package:news_app/core/services/api_service.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';

abstract class NewsRemoteData {
  static Future<Either<Failure, List<ArticleModel>>> fetchCategoryArticles({
    required String category,
  }) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return left(DioExceptions(errorMessage: AppText.networkError));
    }
    var result = await ApiService.getRequest(
      endpoint: "/top-headlines",
      queryParams: {"category": category.toLowerCase(), "country": "us"},
    );
    return result.fold((failure) => left(failure), (categoryData) {
      final listOfArticles = (categoryData.data["articles"] as List)
          .map(
            (article) => ArticleModel.fromJson(article as Map<String, dynamic>),
          )
          .toList();
      return right(listOfArticles);
    });
  }
}
