import '../../../../core/constants/url_constants.dart';
import '../../../../core/enums/period_enums.dart';
import '../../../../core/network/dio_client.dart';
import '../../../models/article_list_model/article_list_model.dart';
import 'article_remote_data_source.dart';

class ArticleRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final DioClient _dioClient;

  const ArticleRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ArticleListModel> getMostPopularArticles({required PeriodEnums period}) async {
    try {
      final response = await _dioClient.get(
        UrlContants.mostPopular.replaceAll('{period}', period.data),
      );

      final articleList = ArticleListModel.fromJson(response.data as Map<String, dynamic>);

      return articleList;
    } on Exception {
      rethrow;
    }
  }
}
