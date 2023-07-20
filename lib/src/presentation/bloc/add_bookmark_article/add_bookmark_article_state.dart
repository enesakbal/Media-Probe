part of 'add_bookmark_article_bloc.dart';

abstract class AddBookmarkArticleState extends Equatable {
  const AddBookmarkArticleState();

  @override
  List<Object> get props => [];
}

class AddBookmarkArticleInitial extends AddBookmarkArticleState {
  const AddBookmarkArticleInitial();
}

class AddBookmarkArticleLoading extends AddBookmarkArticleState {
  const AddBookmarkArticleLoading();
}

class AddBookmarkArticleError extends AddBookmarkArticleState {
  const AddBookmarkArticleError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class AddBookmarkArticleSuccess extends AddBookmarkArticleState {
  const AddBookmarkArticleSuccess();

  @override
  List<Object> get props => [];
}
