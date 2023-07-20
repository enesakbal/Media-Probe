import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/article_list/article_list.dart';
import '../article_model/article_model.dart';

part 'article_list_model.g.dart';

@JsonSerializable()
class ArticleListModel extends Equatable {
  final String? status;
  final String? copyright;
  @JsonKey(name: 'num_results')
  final int? numResults;
  final List<ArticleModel>? results;

  const ArticleListModel({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  ArticleList toEntity() => ArticleList(
      status: status,
      copyright: copyright,
      numResults: numResults,
      results: results?.map((e) => e.toEntity()).toList());

  factory ArticleListModel.fromJson(Map<String, dynamic> json) {
    return _$ArticleListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ArticleListModelToJson(this);

  @override
  List<Object?> get props => [status, copyright, numResults, results];
}
