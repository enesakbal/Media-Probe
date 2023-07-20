import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe/src/domain/entities/article/article.dart';
import 'package:media_probe/src/domain/entities/article_list/article_list.dart';
import 'package:mockito/mockito.dart';

import '../../_utils/test_data.mocks.dart';

void main() {
  late MockArticleListModel mockArticleListModel;
  late MockArticleModel mockArticleModel;

  setUp(() {
    mockArticleListModel = MockArticleListModel();
    mockArticleModel = MockArticleModel();
  });

  group('to Entity', () {
    test(
      'should be a subclass of ArticleList',
      () async {
        when(mockArticleListModel.toEntity()).thenReturn(ArticleList());

        final result = mockArticleListModel.toEntity();
        expect(result, isA<ArticleList>());
      },
    );

    test(
      'should be a subclass of Article',
      () async {
        when(mockArticleModel.toEntity()).thenReturn(Article());

        final result = mockArticleModel.toEntity();
        expect(result, isA<Article>());
      },
    );
  });
}
