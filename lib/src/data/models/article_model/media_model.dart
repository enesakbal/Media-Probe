import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/article/media.dart';
import 'media_meta_data_model.dart';

part 'media_model.g.dart';

@JsonSerializable()
class MediaModel extends Equatable {
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  @JsonKey(name: 'approved_for_syndication')
  final int? approvedForSyndication;
  @JsonKey(name: 'media-metadata')
  final List<MediaMetaDataModel>? mediaMetadata;

  const MediaModel({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });

  Media toEntity() => Media(
        caption: caption,
        approvedForSyndication: approvedForSyndication,
        copyright: copyright,
        mediaMetadata: mediaMetadata?.map((e) => e.toEntity()).toList(),
        subtype: subtype,
        type: type,
      );

  factory MediaModel.fromJson(Map<String, dynamic> json) => _$MediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);

  @override
  List<Object?> get props {
    return [
      type,
      subtype,
      caption,
      copyright,
      approvedForSyndication,
      mediaMetadata,
    ];
  }
}
