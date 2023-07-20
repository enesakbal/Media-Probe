import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe/src/domain/entities/article/article.dart';
import 'package:media_probe/src/presentation/bloc/delete_bookmark_article/delete_bookmark_article_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/test_data.mocks.dart';

void main() async {
  late Article mockArticle;
  late MockArticleUsecases mockArticleUsecases;
  late DeleteBookmarkArticleBloc deleteBookmarkArticleBloc;

  setUp(() {
    mockArticle = MockArticle();
    mockArticleUsecases = MockArticleUsecases();
    deleteBookmarkArticleBloc = DeleteBookmarkArticleBloc(mockArticleUsecases);
  });

  test(
    'initial state should be DeleteBookmarkArticleInitial',
    () {
      expect(deleteBookmarkArticleBloc.state, const DeleteBookmarkArticleInitial());
    },
  );

  blocTest<DeleteBookmarkArticleBloc, DeleteBookmarkArticleState>(
    'should emit [DeleteBookmarkArticleLoading, DeleteBookmarkArticleSuccess] when data is fetched successfully',
    build: () {
      when(mockArticleUsecases.deleteArticle(article: mockArticle)).thenAnswer(
        (_) async => const Right(true),
      );
      return deleteBookmarkArticleBloc;
    },
    act: (bloc) => bloc.add(OnDeleteBookmarkArticle(mockArticle)),
    wait: const Duration(milliseconds: 500),
    expect: () => <DeleteBookmarkArticleState>[
      const DeleteBookmarkArticleLoading(),
      const DeleteBookmarkArticleSuccess(),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.deleteArticle(article: mockArticle)).called(1);
    },
  );

  blocTest<DeleteBookmarkArticleBloc, DeleteBookmarkArticleState>(
    'should emit [DeleteBookmarkArticleLoading, DeleteBookmarkArticleError] when data fetching fails',
    build: () {
      when(mockArticleUsecases.deleteArticle(article: mockArticle)).thenAnswer(
        (_) async => const Left('AN ERROR'),
      );
      return deleteBookmarkArticleBloc;
    },
    act: (bloc) => bloc.add(OnDeleteBookmarkArticle(mockArticle)),
    wait: const Duration(milliseconds: 500),
    expect: () => <DeleteBookmarkArticleState>[
      const DeleteBookmarkArticleLoading(),
      const DeleteBookmarkArticleError('AN ERROR'),
    ],
    verify: (bloc) async {
      verify(mockArticleUsecases.deleteArticle(article: mockArticle)).called(1);
    },
  );
}
