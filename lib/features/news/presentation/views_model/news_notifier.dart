import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/news/data/models/article/source.dart';
import 'package:news_app/features/news/data/repositories/news_repository.dart';
import 'package:news_app/features/news/presentation/views_model/news_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_notifier.g.dart';

@riverpod
class NewsNotifier extends _$NewsNotifier {
  List<List<ArticleModel>> categoryArticlesList = [];
  List<ArticleModel> allArticles = [];
  List<Source> allCategories = [];
  @override
  NewsState build(String categoryId) {
    fetchCategoryNews(category: categoryId);
    return FetchNewsLoadingState();
  }

  Future<void> fetchCategoryNews({required String category}) async {
    var result = await NewsRepository.fetchCategoryArticles(category: category);
    result.fold((failure) => state = FetchNewsFailureState(error: failure), (
      articlesData,
    ) {
      allArticles = articlesData;
      allCategories = articlesData
          .map((category) => category.source)
          .whereType<Source>()
          .toSet()
          .toList();
      initializeAllCategoriesArticles(allCategoriesList: allCategories);
      state = FetchNewsSuccessState();
    });
  }

  void initializeAllCategoriesArticles({
    required List<Source> allCategoriesList,
  }) {
    for (int i = 0; i < allCategoriesList.length; i++) {
      categoryArticlesList.add(
        getCategoryArticles(categoryName: allCategoriesList[i].name ?? ""),
      );
    }
  }

  List<ArticleModel> getCategoryArticles({required String categoryName}) {
    return allArticles
        .where((article) => article.source?.name == categoryName)
        .toList();
  }
}
