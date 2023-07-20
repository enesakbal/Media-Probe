// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ArticleDao? _articleDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `LiteArticleEntity` (`uri` TEXT, `url` TEXT, `id` INTEGER, `assetId` INTEGER, `source` TEXT, `publishedDate` TEXT, `updated` TEXT, `section` TEXT, `subsection` TEXT, `nytdsection` TEXT, `adxKeywords` TEXT, `byline` TEXT, `type` TEXT, `title` TEXT, `abstract` TEXT, `imageUrl` TEXT, `caption` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ArticleDao get articleDao {
    return _articleDaoInstance ??= _$ArticleDao(database, changeListener);
  }
}

class _$ArticleDao extends ArticleDao {
  _$ArticleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _liteArticleEntityInsertionAdapter = InsertionAdapter(
            database,
            'LiteArticleEntity',
            (LiteArticleEntity item) => <String, Object?>{
                  'uri': item.uri,
                  'url': item.url,
                  'id': item.id,
                  'assetId': item.assetId,
                  'source': item.source,
                  'publishedDate': item.publishedDate,
                  'updated': item.updated,
                  'section': item.section,
                  'subsection': item.subsection,
                  'nytdsection': item.nytdsection,
                  'adxKeywords': item.adxKeywords,
                  'byline': item.byline,
                  'type': item.type,
                  'title': item.title,
                  'abstract': item.abstract,
                  'imageUrl': item.imageUrl,
                  'caption': item.caption
                }),
        _liteArticleEntityDeletionAdapter = DeletionAdapter(
            database,
            'LiteArticleEntity',
            ['id'],
            (LiteArticleEntity item) => <String, Object?>{
                  'uri': item.uri,
                  'url': item.url,
                  'id': item.id,
                  'assetId': item.assetId,
                  'source': item.source,
                  'publishedDate': item.publishedDate,
                  'updated': item.updated,
                  'section': item.section,
                  'subsection': item.subsection,
                  'nytdsection': item.nytdsection,
                  'adxKeywords': item.adxKeywords,
                  'byline': item.byline,
                  'type': item.type,
                  'title': item.title,
                  'abstract': item.abstract,
                  'imageUrl': item.imageUrl,
                  'caption': item.caption
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LiteArticleEntity> _liteArticleEntityInsertionAdapter;

  final DeletionAdapter<LiteArticleEntity> _liteArticleEntityDeletionAdapter;

  @override
  Future<List<LiteArticleEntity>?> getBookmarkedArticles() async {
    return _queryAdapter.queryList('SELECT * from LiteArticleEntity',
        mapper: (Map<String, Object?> row) => LiteArticleEntity(
            uri: row['uri'] as String?,
            url: row['url'] as String?,
            id: row['id'] as int?,
            assetId: row['assetId'] as int?,
            source: row['source'] as String?,
            publishedDate: row['publishedDate'] as String?,
            updated: row['updated'] as String?,
            section: row['section'] as String?,
            subsection: row['subsection'] as String?,
            nytdsection: row['nytdsection'] as String?,
            adxKeywords: row['adxKeywords'] as String?,
            byline: row['byline'] as String?,
            caption: row['caption'] as String?,
            type: row['type'] as String?,
            title: row['title'] as String?,
            abstract: row['abstract'] as String?,
            imageUrl: row['imageUrl'] as String?));
  }

  @override
  Future<void> insertArticle(LiteArticleEntity article) async {
    await _liteArticleEntityInsertionAdapter.insert(
        article, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteArticle(LiteArticleEntity article) async {
    await _liteArticleEntityDeletionAdapter.delete(article);
  }
}
