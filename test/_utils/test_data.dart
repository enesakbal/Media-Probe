import 'package:media_probe/src/core/network/dio_client.dart';
import 'package:media_probe/src/data/datasource/local/DAO/article_dao.dart';
import 'package:media_probe/src/data/datasource/local/app_database.dart';
import 'package:media_probe/src/data/datasource/remote/article/article_remote_data_source.dart';
import 'package:media_probe/src/data/models/article_list_model/article_list_model.dart';
import 'package:media_probe/src/data/models/article_model/article_model.dart';
import 'package:media_probe/src/domain/entities/_lite/lite_article_entity.dart';
import 'package:media_probe/src/domain/entities/article/article.dart';
import 'package:media_probe/src/domain/entities/article_list/article_list.dart';
import 'package:media_probe/src/domain/repositories/article/article_repository.dart';
import 'package:media_probe/src/domain/usecases/article_usecases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AppDatabase,
  ArticleDao,
  LiteArticleEntity,
  ArticleRemoteDataSource,
  ArticleRepository,
  ArticleUsecases,
  ArticleModel,
  ArticleListModel,
  Article,
  ArticleList,
], customMocks: [
  MockSpec<DioClient>(as: #MockDioClient)
])
void main() {}
