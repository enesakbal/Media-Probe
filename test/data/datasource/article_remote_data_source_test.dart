import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe/src/core/enums/period_enums.dart';
import 'package:media_probe/src/data/datasource/local/DAO/article_dao.dart';
import 'package:media_probe/src/data/datasource/local/app_database.dart';
import 'package:media_probe/src/data/datasource/remote/article/article_remote_data_source.dart';
import 'package:media_probe/src/data/models/article_list_model/article_list_model.dart';
import 'package:media_probe/src/domain/entities/_lite/lite_article_entity.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/json_reader.dart';
import '../../_utils/test_data.mocks.dart';

void main() {
  late ArticleRemoteDataSource articleRemoteDataSource;
  late AppDatabase database;
  late ArticleDao dao;
  late dynamic tArticleListData;

  late List<LiteArticleEntity> liteArticleEntityList;

  setUp(() {
    tArticleListData = readJson('article_list_dummy_data.json');

    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    database = MockAppDatabase();
    liteArticleEntityList = [LiteArticleEntity(), LiteArticleEntity()];

    articleRemoteDataSource = MockArticleRemoteDataSource();
    dao = MockArticleDao();
  });

  test(
    'when reponse code is 200 response model returns ArticleListModel ',
    () async {
      when(
        articleRemoteDataSource.getMostPopularArticles(period: PeriodEnums.daily),
      ).thenAnswer((_) async => ArticleListModel.fromJson(tArticleListData as Map<String, dynamic>));

      final response = await articleRemoteDataSource.getMostPopularArticles(period: PeriodEnums.daily);

      expect(response, isA<ArticleListModel>());
    },
  );
  test(
    'when local db is not empty returns ArticleListModel ',
    () async {
      when(dao.getBookmarkedArticles()).thenAnswer((_) async => liteArticleEntityList);

      final response = await dao.getBookmarkedArticles();

      expect(response, isA<List<LiteArticleEntity>?>());
    },
  );
  test(
    'when local db is not empty returns empty list ',
    () async {
      when(dao.getBookmarkedArticles()).thenAnswer((_) async => []);

      final response = await dao.getBookmarkedArticles();

      expect(response, []);
    },
  );
  test(
    'when insert a data to local db is returns void ',
    () async {
      when(dao.insertArticle(liteArticleEntityList.first)).thenAnswer((_) async => {});

      final response = await dao.insertArticle(liteArticleEntityList.first);

      expect(() async => response, isA<void>());
    },
  );
  test(
    'when delete a data to local db is returns void ',
    () async {
      when(dao.deleteArticle(liteArticleEntityList.first)).thenAnswer((_) async => {});

      final response = await dao.deleteArticle(liteArticleEntityList.first);

      expect(() async => response, isA<void>());
    },
  );
}
