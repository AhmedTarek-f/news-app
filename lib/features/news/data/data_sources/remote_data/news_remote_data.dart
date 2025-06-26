import 'package:dartz/dartz.dart';
import 'package:news_app/core/exceptions/failure.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';

abstract class NewsRemoteData {
  Future<Either<Failure, List<ArticleModel>>> fetchCategoryArticles({
    required String category,
  });
}
