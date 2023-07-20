import 'media_meta_data.dart';

class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  int? approvedForSyndication;
  List<MediaMetaData>? mediaMetadata;

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approvedForSyndication,
    this.mediaMetadata,
  });
}
