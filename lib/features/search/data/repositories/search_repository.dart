import 'package:dartz/dartz.dart';
import 'package:news_app/core/exceptions/failure.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/search/data/data_sources/remote_data/search_remote_data.dart';

abstract class SearchRepository {
  static Future<Either<Failure, List<ArticleModel>>> fetchSearchArticles({
    required String searchKeyword,
    required int page,
    int pageSize = 5,
  }) async {
    return await SearchRemoteData.fetchSearchArticles(
      searchKeyword: searchKeyword,
      page: page,
      pageSize: pageSize,
    );
  }
}
