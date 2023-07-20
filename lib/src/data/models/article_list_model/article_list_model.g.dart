// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleListModel _$ArticleListModelFromJson(Map<String, dynamic> json) =>
    ArticleListModel(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['num_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleListModelToJson(ArticleListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.numResults,
      'results': instance.results,
    };
