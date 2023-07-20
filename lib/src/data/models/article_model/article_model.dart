import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/article/article.dart';
import 'media_model.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel extends Equatable {
  final String? uri;
  final String? url;
  final int? id;
  @JsonKey(name: 'asset_id')
  final int? assetId;
  final String? source;
  @JsonKey(name: 'published_date')
  final String? publishedDate;
  final String? updated;
  final String? section;
  final String? subsection;
  final String? nytdsection;
  @JsonKey(name: 'adx_keywords')
  final String? adxKeywords;
  final String? byline;
  final String? type;
  final String? title;
  final String? abstract;
  @JsonKey(name: 'des_facet')
  final List<String>? desFacet;
  @JsonKey(name: 'org_facet')
  final List<String>? orgFacet;
  @JsonKey(name: 'per_facet')
  final List<String>? perFacet;
  @JsonKey(name: 'geo_facet')
  final List<String>? geoFacet;
  final List<MediaModel>? media;
  @JsonKey(name: 'eta_id')
  final int? etaId;

  const ArticleModel({
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
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  Article toEntity() => Article(
        uri: uri,
        abstract: abstract,
        adxKeywords: adxKeywords,
        assetId: assetId,
        byline: byline,
        etaId: etaId,
        id: id,
        imageUrl: media?.firstWhereOrNull((element) => element.type == 'image')?.mediaMetadata?.last.url ?? '',
        media: media?.map((e) => e.toEntity()).toList(),
        nytdsection: nytdsection,
        publishedDate: publishedDate,
        section: section,
        source: source,
        subsection: subsection,
        title: title,
        type: type,
        updated: updated,
        url: url,
        caption: media?.firstWhereOrNull((element) => element.type == 'image')?.caption ?? '',
      );

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return _$ArticleModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  @override
  List<Object?> get props {
    return [
      uri,
      url,
      id,
      assetId,
      source,
      publishedDate,
      updated,
      section,
      subsection,
      nytdsection,
      adxKeywords,
      byline,
      type,
      title,
      abstract,
      desFacet,
      orgFacet,
      perFacet,
      geoFacet,
      media,
      etaId,
    ];
  }
}
