import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/enums/period_enums.dart';
import '../../../core/network/network_exception.dart';
import '../../../domain/entities/article/article.dart';
import '../../../domain/entities/article_list/article_list.dart';
import '../../../domain/repositories/article/article_repository.dart';
import '../../datasource/local/app_database.dart';
import '../../datasource/remote/article/article_remote_data_source.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource _articleRemoteDataSource;
  final AppDatabase _appDatabase;

  const ArticleRepositoryImpl(this._articleRemoteDataSource, this._appDatabase);

  @override
  Future<Either<NetworkExceptions, ArticleList>> getMostPopularArticles({required PeriodEnums period}) async {
    try {
      final result = await _articleRemoteDataSource.getMostPopularArticles(period: period);

      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkExceptions.fromDioError(e));
    }
  }

  //* DB

  @override
  Future<Either<String, List<Article>?>> getBookmarkedArticles() async {
    try {
      final articles = await _appDatabase.articleDao.getBookmarkedArticles();

      return Right(articles?.map((e) => e.toArticle()).toList());
    } on Exception catch (_) {
      return const Left('Unexpected error occurred');
    }
  }

  @override
  Future<Either<String, bool>> insertArticle({required Article article}) async {
    try {
      await _appDatabase.articleDao.insertArticle(article.toLiteArticleEntity());

      return const Right(true);
    } on Exception catch (_) {
      return const Left('Unexpected error occurred');
    }
  }

  @override
  Future<Either<String, bool>> deleteArticle({required Article article}) async {
    try {
      await _appDatabase.articleDao.deleteArticle(article.toLiteArticleEntity());

      return const Right(true);
    } on Exception catch (_) {
      return const Left('Unexpected error occurred');
    }
  }
}
