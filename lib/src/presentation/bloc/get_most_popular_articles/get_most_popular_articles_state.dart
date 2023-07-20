part of 'get_most_popular_articles_bloc.dart';

abstract class GetMostPopularArticlesState extends Equatable {
  const GetMostPopularArticlesState();

  @override
  List<Object> get props => [];
}

class GetMostPopularArticlesInitial extends GetMostPopularArticlesState {
  const GetMostPopularArticlesInitial();
}

class GetMostPopularArticlesLoading extends GetMostPopularArticlesState {
  const GetMostPopularArticlesLoading();
}

class GetMostPopularArticlesEmpty extends GetMostPopularArticlesState {
  const GetMostPopularArticlesEmpty(this.message);

    final String message;

  @override
  List<Object> get props => [message];
}

class GetMostPopularArticlesError extends GetMostPopularArticlesState {
  const GetMostPopularArticlesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class GetMostPopularArticlesSuccess extends GetMostPopularArticlesState {
  const GetMostPopularArticlesSuccess(this.articleList);

  final ArticleList articleList;

  @override
  List<Object> get props => [articleList];
}
