import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/article/article.dart';
import '../../../domain/usecases/article_usecases.dart';

part 'delete_bookmark_article_event.dart';
part 'delete_bookmark_article_state.dart';

class DeleteBookmarkArticleBloc extends Bloc<DeleteBookmarkArticleEvent, DeleteBookmarkArticleState> {
  DeleteBookmarkArticleBloc(this._articleUsecases) : super(const DeleteBookmarkArticleInitial()) {
    on<OnDeleteBookmarkArticle>(_onDeleteBookmarkArticle);
  }

  FutureOr<void> _onDeleteBookmarkArticle(
      OnDeleteBookmarkArticle event, Emitter<DeleteBookmarkArticleState> emit) async {
    emit(const DeleteBookmarkArticleLoading());

    final result = await _articleUsecases.deleteArticle(article: event.article);

    result.fold(
      (failure) => emit(DeleteBookmarkArticleError(failure)),
      (data) => emit(const DeleteBookmarkArticleSuccess()),
    );
  }

  final ArticleUsecases _articleUsecases;
}
