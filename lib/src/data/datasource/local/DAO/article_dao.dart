import 'package:floor/floor.dart';

import '../../../../core/constants/db_constants.dart';
import '../../../../domain/entities/_lite/lite_article_entity.dart';

/// This class is a data access object (DAO) that allows us to query the database for playlist tracks
@dao
abstract class ArticleDao {
  /// A query that returns a list of LocalPlaylistTrack objects.
  @Query('SELECT * from ${DBConstants.tableName}')
  Future<List<LiteArticleEntity>?> getBookmarkedArticles();

  @insert
  Future<void> insertArticle(LiteArticleEntity article);

  @delete
  Future<void> deleteArticle(LiteArticleEntity article);
}
