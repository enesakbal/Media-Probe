part of 'get_book_marked_articles_bloc.dart';

abstract class GetBookMarkedArticlesState extends Equatable {
  const GetBookMarkedArticlesState();

  @override
  List<Object> get props => [];
}

class GetBookMarkedArticlesInitial extends GetBookMarkedArticlesState {
  const GetBookMarkedArticlesInitial();
}

class GetBookMarkedArticlesLoading extends GetBookMarkedArticlesState {
  const GetBookMarkedArticlesLoading();
}

class GetBookMarkedArticlesEmpty extends GetBookMarkedArticlesState {
  const GetBookMarkedArticlesEmpty(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class GetBookMarkedArticlesError extends GetBookMarkedArticlesState {
  const GetBookMarkedArticlesError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class GetBookMarkedArticlesSuccess extends GetBookMarkedArticlesState {
  const GetBookMarkedArticlesSuccess(this.list);

  final List<Article> list;

  @override
  List<Object> get props => [list];
}
