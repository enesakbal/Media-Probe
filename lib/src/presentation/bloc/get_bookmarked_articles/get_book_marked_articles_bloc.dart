import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/article/article.dart';
import '../../../domain/usecases/article_usecases.dart';

part 'get_book_marked_articles_event.dart';
part 'get_book_marked_articles_state.dart';

class GetBookMarkedArticlesBloc extends Bloc<GetBookMarkedArticlesEvent, GetBookMarkedArticlesState> {
  GetBookMarkedArticlesBloc(this._articleUsecases) : super(const GetBookMarkedArticlesInitial()) {
    on<OnGetBookMarkedArticles>(_onGetBookMarkedArticles);
  }

  FutureOr<void> _onGetBookMarkedArticles(
      OnGetBookMarkedArticles event, Emitter<GetBookMarkedArticlesState> emit) async {
    emit(const GetBookMarkedArticlesLoading());

    final result = await _articleUsecases.getBookmarkedArticles();

    result.fold(
      (failure) => emit(GetBookMarkedArticlesError(failure)),
      (data) {
        if (data?.isEmpty ?? true) {
          return emit(const GetBookMarkedArticlesEmpty("You haven't bookmarked an article yet"));
        }
        bookmarkedList.addAll(data ?? []);
        return emit(GetBookMarkedArticlesSuccess(data ?? []));
      },
    );
  }

  final ArticleUsecases _articleUsecases;
  final List<Article> bookmarkedList = [];
}
