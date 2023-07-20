import 'package:floor/floor.dart';

import '../article/article.dart';

@entity
class LiteArticleEntity {
  String? uri;
  String? url;
  @PrimaryKey()
  int? id;
  int? assetId;
  String? source;
  String? publishedDate;
  String? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  String? byline;
  String? type;
  String? title;
  String? abstract;
  String? imageUrl;
  String? caption;

  LiteArticleEntity({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.byline,
    this.caption,
    this.type,
    this.title,
    this.abstract,
    this.imageUrl,
  });

  Article toArticle() => Article(
        abstract: abstract,
        adxKeywords: adxKeywords,
        assetId: assetId,
        byline: byline,
        id: id,
        imageUrl: imageUrl,
        nytdsection: nytdsection,
        publishedDate: publishedDate,
        section: section,
        source: source,
        subsection: subsection,
        title: title,
        type: type,
        caption: caption,
        updated: updated,
        url: url,
        uri: uri,
      );
}
