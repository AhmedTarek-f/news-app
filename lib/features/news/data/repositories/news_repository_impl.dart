import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/exceptions/failure.dart';
import 'package:news_app/features/news/data/data_sources/remote_data/news_remote_data.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  @factoryMethod
  const NewsRepositoryImpl({required this.newsRemoteData});
  final NewsRemoteData newsRemoteData;
  @override
  Future<Either<Failure, List<ArticleModel>>> fetchCategoryArticles({
    required String category,
  }) async {
    return await newsRemoteData.fetchCategoryArticles(category: category);
  }
}
