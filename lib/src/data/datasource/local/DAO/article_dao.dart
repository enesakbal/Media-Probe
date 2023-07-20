import 'package:floor/floor.dart';

import '../../../../core/constants/db_constants.dart';
import '../../../../domain/entities/_lite/lite_article_entity.dart';

@dao
abstract class ArticleDao {
  @Query('SELECT * from ${DBConstants.tableName}')
  Future<List<LiteArticleEntity>?> getBookmarkedArticles();

  @insert
  Future<void> insertArticle(LiteArticleEntity article);

  @delete
  Future<void> deleteArticle(LiteArticleEntity article);
}
