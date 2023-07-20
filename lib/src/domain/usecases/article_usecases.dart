import 'package:dartz/dartz.dart';

import '../../core/enums/period_enums.dart';
import '../../core/network/network_exception.dart';
import '../entities/article/article.dart';
import '../entities/article_list/article_list.dart';
import '../repositories/article/article_repository.dart';

class ArticleUsecases {
  final ArticleRepository _articleRepository;

  const ArticleUsecases(this._articleRepository);

  //* REMOTE
  Future<Either<NetworkExceptions, ArticleList>> getMostPopularArticles({required PeriodEnums period}) =>
      _articleRepository.getMostPopularArticles(period: period);

  //* LOCAL
  Future<Either<String, List<Article>?>> getBookmarkedArticles() => _articleRepository.getBookmarkedArticles();

  Future<Either<String, bool>> insertArticle({required Article article}) =>
      _articleRepository.insertArticle(article: article);

  Future<Either<String, bool>> deleteArticle({required Article article}) =>
      _articleRepository.deleteArticle(article: article);
}
