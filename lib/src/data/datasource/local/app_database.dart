import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entities/_lite/lite_article_entity.dart';
import 'DAO/article_dao.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [LiteArticleEntity])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
