part of 'get_most_popular_articles_bloc.dart';

abstract class GetMostPopularArticlesEvent extends Equatable {
  const GetMostPopularArticlesEvent();

  @override
  List<Object> get props => [];
}

class OnGetMostPopularArticles extends GetMostPopularArticlesEvent {
  const OnGetMostPopularArticles(this.period);

  final PeriodEnums period;

  @override
  List<Object> get props => [period];
}
