import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe/src/domain/entities/article/article.dart';
import 'package:media_probe/src/presentation/bloc/get_bookmarked_articles/get_book_marked_articles_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/test_data.mocks.dart';

void main() async {
  late Article mockArticle;
  late List<Article> mockArticleList;

  late MockArticleUsecases mockArticleUsecases;
  late GetBookMarkedArticlesBloc getBookMarkedArticlesBloc;

  setUp(() {
    mockArticle = MockArticle();
    mockArticleList = [mockArticle, mockArticle];
    mockArticleUsecases = MockArticleUsecases();
    getBookMarkedArticlesBloc = GetBookMarkedArticlesBloc(mockArticleUsecases);
  });

  test(
    'initial state should be GetBookMarkedArticlesInitial',
    () {
      expect(getBookMarkedArticlesBloc.state, const GetBookMarkedArticlesInitial());
    },
  );

  blocTest<GetBookMarkedArticlesBloc, GetBookMarkedArticlesState>(
    'should emit [GetBookMarkedArticlesLoading, GetBookMarkedArticlesSuccess] when data is fetched successfully',
    build: () {
      when(mockArticleUsecases.getBookmarkedArticles()).thenAnswer(
        (_) async => Right(mockArticleList),
      );
      return getBookMarkedArticlesBloc;
    },
    act: (bloc) => bloc.add(const OnGetBookMarkedArticles()),
    wait: const Duration(milliseconds: 500),
    expect: () => <GetBookMarkedArticlesState>[
      const GetBookMarkedArticlesLoading(),
      GetBookMarkedArticlesSuccess(mockArticleList),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.getBookmarkedArticles()).called(1);
    },
  );

  blocTest<GetBookMarkedArticlesBloc, GetBookMarkedArticlesState>(
    'should emit [GetBookMarkedArticlesLoading, GetMostPopularArticlesError] when data fetching fails',
    build: () {
      when(mockArticleUsecases.getBookmarkedArticles()).thenAnswer(
        (_) async => const Left('AN ERROR'),
      );
      return getBookMarkedArticlesBloc;
    },
    act: (bloc) => bloc.add(const OnGetBookMarkedArticles()),
    wait: const Duration(milliseconds: 500),
    expect: () => <GetBookMarkedArticlesState>[
      const GetBookMarkedArticlesLoading(),
      const GetBookMarkedArticlesError('AN ERROR'),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.getBookmarkedArticles()).called(1);
    },
  );

  blocTest<GetBookMarkedArticlesBloc, GetBookMarkedArticlesState>(
    'should emit [GetBookMarkedArticlesLoading, GetMostPopularArticlesEmpty] when data is empty',
    build: () {
      final emptyArticleList = <Article>[];
      when(mockArticleUsecases.getBookmarkedArticles()).thenAnswer(
        (_) async => Right(emptyArticleList),
      );
      return getBookMarkedArticlesBloc;
    },
    act: (bloc) => bloc.add(const OnGetBookMarkedArticles()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      const GetBookMarkedArticlesLoading(),
      const GetBookMarkedArticlesEmpty("You haven't bookmarked an article yet"),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.getBookmarkedArticles()).called(1);
    },
  );
}
