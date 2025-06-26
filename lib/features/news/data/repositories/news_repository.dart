import 'package:dartz/dartz.dart';
import 'package:news_app/core/exceptions/failure.dart';
import 'package:news_app/features/news/data/data_sources/remote_data/news_remote_data.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';

abstract class NewsRepository {
  static Future<Either<Failure, List<ArticleModel>>> fetchCategoryArticles({
    required String category,
  }) async {
    return await NewsRemoteData.fetchCategoryArticles(category: category);
  }
}
