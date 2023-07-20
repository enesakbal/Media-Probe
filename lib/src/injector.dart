import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'config/router/app_router.dart';
import 'core/constants/db_constants.dart';
import 'core/network/dio_client.dart';
import 'data/datasource/local/app_database.dart';
import 'data/datasource/remote/article/article_remote_data_source.dart';
import 'data/datasource/remote/article/article_remote_data_source_impl.dart';
import 'data/repositories/article/article_repository_impl.dart';
import 'domain/repositories/article/article_repository.dart';
import 'domain/usecases/article_usecases.dart';
import 'presentation/bloc/add_bookmark_article/add_bookmark_article_bloc.dart';
import 'presentation/bloc/delete_bookmark_article/delete_bookmark_article_bloc.dart';
import 'presentation/bloc/get_bookmarked_articles/get_book_marked_articles_bloc.dart';
import 'presentation/bloc/get_most_popular_articles/get_most_popular_articles_bloc.dart';

/// Register all the dependencies that are needed for the app to run.
final injector = GetIt.instance;

/// It initializes the dependency injection.
///
Future<void> init() async {
  final database = await $FloorAppDatabase.databaseBuilder(DBConstants.databaseName).build();
  injector

    //* LOCAL DB
    ..registerSingleton<AppDatabase>(database)

    //* DIO CLIENT
    ..registerLazySingleton<DioClient>(() => DioClient(Dio()))

    //* DATA SOURCE
    ..registerLazySingleton<ArticleRemoteDataSource>(() => ArticleRemoteDataSourceImpl(injector()))

    //* REPOSITORY
    ..registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(injector(), injector()))

    //* USECASES
    ..registerLazySingleton<ArticleUsecases>(() => ArticleUsecases(injector()))

    //* BLOC
    ..registerFactory<GetMostPopularArticlesBloc>(() => GetMostPopularArticlesBloc(injector()))
    ..registerFactory<GetBookMarkedArticlesBloc>(() => GetBookMarkedArticlesBloc(injector()))
    ..registerFactory<DeleteBookmarkArticleBloc>(() => DeleteBookmarkArticleBloc(injector()))
    ..registerFactory<AddBookmarkArticleBloc>(() => AddBookmarkArticleBloc(injector()))

    //* CONFIG
    ..registerLazySingleton(() => AppRouter());
}
