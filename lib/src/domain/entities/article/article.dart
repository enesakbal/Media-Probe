import 'package:collection/collection.dart';

import '../_lite/lite_article_entity.dart';
import 'media.dart';

class Article {
  String? uri;
  String? url;
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
  String? caption;
  List<Media>? media;
  int? etaId;
  String? imageUrl;

  Article({
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
    this.type,
    this.title,
    this.abstract,
    this.media,
    this.etaId,
    this.imageUrl,
    this.caption,
  });

  LiteArticleEntity toLiteArticleEntity() => LiteArticleEntity(
        abstract: abstract,
        adxKeywords: adxKeywords,
        assetId: assetId,
        byline: byline,
        id: id,
        imageUrl: media?.firstWhereOrNull((e) => e.type == 'image')?.mediaMetadata?.last.url ?? '',
        nytdsection: nytdsection,
        publishedDate: publishedDate,
        section: section,
        source: source,
        subsection: subsection,
        title: title,
        type: type,
        caption: media?.firstWhereOrNull((element) => element.type == 'image')?.caption ?? '',
        updated: updated,
        url: url,
        uri: uri,
      );
}
