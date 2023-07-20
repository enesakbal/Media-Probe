part of 'add_bookmark_article_bloc.dart';

abstract class AddBookmarkArticleEvent extends Equatable {
  const AddBookmarkArticleEvent();

  @override
  List<Object> get props => [];
}

class OnAddBookmarkArticle extends AddBookmarkArticleEvent {
  const OnAddBookmarkArticle(this.article);

  final Article article;

  @override
  List<Object> get props => [article];
}
