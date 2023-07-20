import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/article/article.dart';
import '../../../domain/usecases/article_usecases.dart';

part 'add_bookmark_article_event.dart';
part 'add_bookmark_article_state.dart';

class AddBookmarkArticleBloc extends Bloc<AddBookmarkArticleEvent, AddBookmarkArticleState> {
  AddBookmarkArticleBloc(this._articleUsecases) : super(const AddBookmarkArticleInitial()) {
    on<OnAddBookmarkArticle>(_onAddBookmarkArticle);
  }

  FutureOr<void> _onAddBookmarkArticle(OnAddBookmarkArticle event, Emitter<AddBookmarkArticleState> emit) async {
    emit(const AddBookmarkArticleLoading());

    final result = await _articleUsecases.insertArticle(article: event.article);

    result.fold(
      (failure) => emit(AddBookmarkArticleError(failure)),
      (data) => emit(const AddBookmarkArticleSuccess()),
    );
  }

  final ArticleUsecases _articleUsecases;
}
