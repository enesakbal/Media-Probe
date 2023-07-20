import '../../../../core/enums/period_enums.dart';
import '../../../models/article_list_model/article_list_model.dart';

abstract class ArticleRemoteDataSource {
  Future<ArticleListModel> getMostPopularArticles({required PeriodEnums period});
}
