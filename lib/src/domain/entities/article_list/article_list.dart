import '../article/article.dart';

class ArticleList {
  String? status;
  String? copyright;
  int? numResults;
  List<Article>? results;

  ArticleList({this.status, this.copyright, this.numResults, this.results});
}
