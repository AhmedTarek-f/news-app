import 'package:dartz/dartz.dart';
import 'package:news_app/core/exceptions/dio_exceptions.dart';
import 'package:news_app/core/exceptions/failure.dart';
import 'package:news_app/features/news/data/data_sources/remote_data/news_remote_data.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class NewsRepository {
  static Future<Either<Failure, List<ArticleModel>>> fetchCategoryArticles({
    required String category,
  }) async {
    return await NewsRemoteData.fetchCategoryArticles(category: category);
  }

  static Future<Either<Failure, void>> launchInBrowserView(String url) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);
      return right(null);
    } catch (e) {
      return left(DioExceptions(errorMessage: e.toString()));
    }
  }
}
