import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe/src/core/constants/url_constants.dart';
import 'package:media_probe/src/core/enums/period_enums.dart';
import 'package:media_probe/src/core/network/network_exception.dart';
import 'package:media_probe/src/domain/entities/article/article.dart';
import 'package:media_probe/src/domain/usecases/article_usecases.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/test_data.mocks.dart';

void main() {
  late MockArticleList mockArticleList;
  late MockArticle mockArticle;
  late MockArticleRepository mockArticleRepository;
  late ArticleUsecases articleUsecases;

  late List<Article> articleList;

  setUp(() {
    mockArticleList = MockArticleList();
    mockArticle = MockArticle();
    mockArticleRepository = MockArticleRepository();
    articleUsecases = ArticleUsecases(mockArticleRepository);
    articleList = [mockArticle, mockArticle];
  });

  test(
    'should get article list entity from the repository',
    () async {
      when(mockArticleRepository.getMostPopularArticles(period: PeriodEnums.daily)).thenAnswer((_) async {
        return Right(mockArticleList);
      });

      final result = await articleUsecases.getMostPopularArticles(period: PeriodEnums.daily);

      expect(result, equals(Right(mockArticleList)));
    },
  );
  test(
    'should throw NetworkExceptions from the repository',
    () async {
      when(mockArticleRepository.getMostPopularArticles(period: PeriodEnums.daily)).thenAnswer((_) async {
        return Left(
          NetworkExceptions.fromDioError(DioException(requestOptions: RequestOptions(path: UrlContants.mostPopular))),
        );
      });

      final result = await articleUsecases.getMostPopularArticles(period: PeriodEnums.daily);

      expect(
        result,
        equals(Left(
          NetworkExceptions.fromDioError(DioException(requestOptions: RequestOptions(path: UrlContants.mostPopular))),
        )),
      );
    },
  );

//* LOCAL
  test(
    'should get article list entity fromthe repository (local DB)',
    () async {
      when(mockArticleRepository.getBookmarkedArticles()).thenAnswer((_) async {
        return Right(articleList);
      });

      final result = await articleUsecases.getBookmarkedArticles();

      expect(result, equals(Right(articleList)));
    },
  );

  test(
    'while insert any article into appdatabase should true returns  from the repository (local DB)',
    () async {
      when(mockArticleRepository.insertArticle(article: mockArticle)).thenAnswer((_) async {
        return const Right(true);
      });

      final result = await articleUsecases.insertArticle(article: mockArticle);

      expect(result, equals(const Right(true)));
    },
  );

  test(
    'while insert any article into appdatabase should message returns from the repository (local DB)',
    () async {
      when(mockArticleRepository.insertArticle(article: mockArticle)).thenAnswer((_) async {
        return const Left('AN ERROR');
      });

      final result = await articleUsecases.insertArticle(article: mockArticle);

      expect(result, equals(const Left('AN ERROR')));
    },
  );

  test(
    'while delete any article into appdatabase should true returns  from the repository (local DB)',
    () async {
      when(mockArticleRepository.deleteArticle(article: mockArticle)).thenAnswer((_) async {
        return const Right(true);
      });

      final result = await articleUsecases.deleteArticle(article: mockArticle);

      expect(result, equals(const Right(true)));
    },
  );

  test(
    'while delete any article into appdatabase should message returns from the repository (local DB)',
    () async {
      when(mockArticleRepository.deleteArticle(article: mockArticle)).thenAnswer((_) async {
        return const Left('AN ERROR');
      });

      final result = await articleUsecases.deleteArticle(article: mockArticle);

      expect(result, equals(const Left('AN ERROR')));
    },
  );
}
