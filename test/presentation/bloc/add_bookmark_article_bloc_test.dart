import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe/src/domain/entities/article/article.dart';
import 'package:media_probe/src/presentation/bloc/add_bookmark_article/add_bookmark_article_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/test_data.mocks.dart';

void main() async {
  late Article mockArticle;
  late MockArticleUsecases mockArticleUsecases;
  late AddBookmarkArticleBloc addBookmarkArticleBloc;

  setUp(() {
    mockArticle = MockArticle();
    mockArticleUsecases = MockArticleUsecases();
    addBookmarkArticleBloc = AddBookmarkArticleBloc(mockArticleUsecases);
  });

  test(
    'initial state should be AddBookmarkArticleInitial',
    () {
      expect(addBookmarkArticleBloc.state, const AddBookmarkArticleInitial());
    },
  );

  blocTest<AddBookmarkArticleBloc, AddBookmarkArticleState>(
    'should emit [AddBookmarkArticleLoading, AddBookmarkArticleSuccess] when data is fetched successfully',
    build: () {
      when(mockArticleUsecases.insertArticle(article: mockArticle)).thenAnswer(
        (_) async => const Right(true),
      );
      return addBookmarkArticleBloc;
    },
    act: (bloc) => bloc.add(OnAddBookmarkArticle(mockArticle)),
    wait: const Duration(milliseconds: 500),
    expect: () => <AddBookmarkArticleState>[
      const AddBookmarkArticleLoading(),
      const AddBookmarkArticleSuccess(),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.insertArticle(article: mockArticle)).called(1);
    },
  );

  blocTest<AddBookmarkArticleBloc, AddBookmarkArticleState>(
    'should emit [AddBookmarkArticleLoading, AddBookmarkArticleError] when data fetching fails',
    build: () {
      when(mockArticleUsecases.insertArticle(article: mockArticle)).thenAnswer(
        (_) async => const Left('AN ERROR'),
      );
      return addBookmarkArticleBloc;
    },
    act: (bloc) => bloc.add(OnAddBookmarkArticle(mockArticle)),
    wait: const Duration(milliseconds: 500),
    expect: () => <AddBookmarkArticleState>[
      const AddBookmarkArticleLoading(),
      const AddBookmarkArticleError('AN ERROR'),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.insertArticle(article: mockArticle)).called(1);
    },
  );
}
