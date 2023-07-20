import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/enums/period_enums.dart';
import '../../../domain/entities/article_list/article_list.dart';
import '../../../domain/usecases/article_usecases.dart';

part 'get_most_popular_articles_event.dart';
part 'get_most_popular_articles_state.dart';

class GetMostPopularArticlesBloc extends Bloc<GetMostPopularArticlesEvent, GetMostPopularArticlesState> {
  GetMostPopularArticlesBloc(this._articleUsecases) : super(const GetMostPopularArticlesInitial()) {
    on<OnGetMostPopularArticles>(_onGetMostPopularArticles);
  }

  FutureOr<void> _onGetMostPopularArticles(
      OnGetMostPopularArticles event, Emitter<GetMostPopularArticlesState> emit) async {
    emit(const GetMostPopularArticlesLoading());

    final result = await _articleUsecases.getMostPopularArticles(period: event.period);

    result.fold(
      (failure) => emit(GetMostPopularArticlesError(failure.message)),
      (data) {
        if (data.numResults == 0) {
          return emit(const GetMostPopularArticlesEmpty('There is no data'));
        }
        return emit(GetMostPopularArticlesSuccess(data));
      },
    );
  }

  final ArticleUsecases _articleUsecases;
}
