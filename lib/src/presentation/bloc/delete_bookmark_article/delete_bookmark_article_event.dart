part of 'delete_bookmark_article_bloc.dart';

abstract class DeleteBookmarkArticleEvent extends Equatable {
  const DeleteBookmarkArticleEvent();

  @override
  List<Object> get props => [];
}

class OnDeleteBookmarkArticle extends DeleteBookmarkArticleEvent {
  const OnDeleteBookmarkArticle(this.article);

  final Article article;

  @override
  List<Object> get props => [article];
}
