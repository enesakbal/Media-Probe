part of 'delete_bookmark_article_bloc.dart';

abstract class DeleteBookmarkArticleState extends Equatable {
  const DeleteBookmarkArticleState();

  @override
  List<Object> get props => [];
}

class DeleteBookmarkArticleInitial extends DeleteBookmarkArticleState {
  const DeleteBookmarkArticleInitial();
}

class DeleteBookmarkArticleLoading extends DeleteBookmarkArticleState {
  const DeleteBookmarkArticleLoading();
}

class DeleteBookmarkArticleError extends DeleteBookmarkArticleState {
  const DeleteBookmarkArticleError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class DeleteBookmarkArticleSuccess extends DeleteBookmarkArticleState {
  const DeleteBookmarkArticleSuccess();
}
