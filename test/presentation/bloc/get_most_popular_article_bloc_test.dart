import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe/src/core/constants/url_constants.dart';
import 'package:media_probe/src/core/enums/period_enums.dart';
import 'package:media_probe/src/core/network/network_exception.dart';
import 'package:media_probe/src/data/models/article_list_model/article_list_model.dart';
import 'package:media_probe/src/domain/entities/article_list/article_list.dart';
import 'package:media_probe/src/presentation/bloc/get_most_popular_articles/get_most_popular_articles_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/json_reader.dart';
import '../../_utils/test_data.mocks.dart';

void main() async {
  late dynamic tArticleListData;
  late ArticleList tArticleList;

  late MockArticleUsecases mockArticleUsecases;
  late GetMostPopularArticlesBloc getMostPopularArticlesBloc;

  setUp(() {
    tArticleListData = readJson('article_list_dummy_data.json');
    tArticleList = ArticleListModel.fromJson(tArticleListData as Map<String, dynamic>).toEntity();

    mockArticleUsecases = MockArticleUsecases();
    getMostPopularArticlesBloc = GetMostPopularArticlesBloc(mockArticleUsecases);
  });

  test(
    'initial state should be GetMostPopularArticlesInitial',
    () {
      expect(getMostPopularArticlesBloc.state, const GetMostPopularArticlesInitial());
    },
  );

  blocTest<GetMostPopularArticlesBloc, GetMostPopularArticlesState>(
    'should emit [GetMostPopularArticlesLoading, GetMostPopularArticlesSuccess] when data is fetched successfully',
    build: () {
      when(mockArticleUsecases.getMostPopularArticles(period: PeriodEnums.daily)).thenAnswer(
        (_) async => Right(tArticleList),
      );
      return getMostPopularArticlesBloc;
    },
    act: (bloc) => bloc.add(const OnGetMostPopularArticles(PeriodEnums.daily)),
    wait: const Duration(milliseconds: 500),
    expect: () => <GetMostPopularArticlesState>[
      const GetMostPopularArticlesLoading(),
      GetMostPopularArticlesSuccess(tArticleList),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.getMostPopularArticles(period: PeriodEnums.daily)).called(1);
    },
  );

  blocTest<GetMostPopularArticlesBloc, GetMostPopularArticlesState>(
    'should emit [GetMostPopularArticlesLoading, GetMostPopularArticlesError] when data fetching fails',
    build: () {
      when(mockArticleUsecases.getMostPopularArticles(period: PeriodEnums.daily)).thenAnswer(
        (_) async => Left(
          NetworkExceptions.fromDioError(
            DioException(
              requestOptions: RequestOptions(path: UrlContants.mostPopular),
            ),
          ),
        ),
      );
      return getMostPopularArticlesBloc;
    },
    act: (bloc) => bloc.add(const OnGetMostPopularArticles(PeriodEnums.daily)),
    wait: const Duration(milliseconds: 500),
    expect: () => <GetMostPopularArticlesState>[
      const GetMostPopularArticlesLoading(),
      const GetMostPopularArticlesError('Something went wrong'),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.getMostPopularArticles(period: PeriodEnums.daily)).called(1);
    },
  );

  blocTest<GetMostPopularArticlesBloc, GetMostPopularArticlesState>(
    'should emit [GetMostPopularArticlesLoading, GetMostPopularArticlesEmpty] when data is empty',
    build: () {
      final emptyArticleList = ArticleList(numResults: 0, results: []);
      when(mockArticleUsecases.getMostPopularArticles(period: PeriodEnums.daily)).thenAnswer(
        (_) async => Right(emptyArticleList),
      );
      return getMostPopularArticlesBloc;
    },
    act: (bloc) => bloc.add(const OnGetMostPopularArticles(PeriodEnums.daily)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const GetMostPopularArticlesLoading(),
      const GetMostPopularArticlesEmpty('There is no data'),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.getMostPopularArticles(period: PeriodEnums.daily)).called(1);
    },
  );
}
