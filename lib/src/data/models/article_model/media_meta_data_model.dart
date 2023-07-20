import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/article/media_meta_data.dart';

part 'media_meta_data_model.g.dart';

@JsonSerializable()
class MediaMetaDataModel extends Equatable {
  final String? url;
  final String? format;
  final int? height;
  final int? width;

  const MediaMetaDataModel({this.url, this.format, this.height, this.width});

  factory MediaMetaDataModel.fromJson(Map<String, dynamic> json) {
    return _$MediaMetaDataModelFromJson(json);
  }

  MediaMetaData toEntity() => MediaMetaData(
        url: url,
        format: format,
        height: height,
        width: width,
      );

  Map<String, dynamic> toJson() => _$MediaMetaDataModelToJson(this);

  @override
  List<Object?> get props => [url, format, height, width];
}
