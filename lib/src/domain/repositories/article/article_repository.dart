import 'package:dartz/dartz.dart';

import '../../../core/enums/period_enums.dart';
import '../../../core/network/network_exception.dart';
import '../../entities/article/article.dart';
import '../../entities/article_list/article_list.dart';

abstract class ArticleRepository {
  //* REMOTE
  Future<Either<NetworkExceptions, ArticleList>> getMostPopularArticles({required PeriodEnums period});

  //* DB
  Future<Either<String, List<Article>?>> getBookmarkedArticles();

  Future<Either<String, bool>> insertArticle({required Article article});

  Future<Either<String, bool>> deleteArticle({required Article article});
}
