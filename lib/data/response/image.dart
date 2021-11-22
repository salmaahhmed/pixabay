import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class Image extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'pageURL')
  final String? pageUrl;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'tags')
  final String? tags;
  @JsonKey(name: 'previewURL')
  final String? previewUrl;
  @JsonKey(name: 'previewWidth')
  final int? previewWidth;
  @JsonKey(name: 'previewHeight')
  final int? previewHeight;
  @JsonKey(name: 'webformatURL')
  final String? webformatUrl;
  @JsonKey(name: 'webformatWidth')
  final int? webformatWidth;
  @JsonKey(name: 'webformatHeight')
  final int? webformatHeight;
  @JsonKey(name: 'largeImageURL')
  final String? largeImageUrl;
  @JsonKey(name: 'fullHDURL')
  final String? fullHdurl;
  @JsonKey(name: 'imageURL')
  final String? imageUrl;
  @JsonKey(name: 'imageWidth')
  final int? imageWidth;
  @JsonKey(name: 'imageHeight')
  final int? imageHeight;
  @JsonKey(name: 'imageSize')
  final int? imageSize;
  @JsonKey(name: 'views')
  final int? views;
  @JsonKey(name: 'downloads')
  final int? downloads;
  @JsonKey(name: 'likes')
  final int? likes;
  @JsonKey(name: 'comments')
  final int? comments;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'user')
  final String? user;
  @JsonKey(name: 'userImageURL')
  final String? userImageUrl;

  Image({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.fullHdurl,
    this.imageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.pageUrl,
        this.type,
        this.tags,
        this.previewUrl,
        this.previewWidth,
        this.previewHeight,
        this.webformatUrl,
        this.webformatWidth,
        this.webformatHeight,
        this.largeImageUrl,
        this.fullHdurl,
        this.imageUrl,
        this.imageWidth,
        this.imageHeight,
        this.imageSize,
        this.views,
        this.downloads,
        this.likes,
        this.comments,
        this.userId,
        this.user,
        this.userImageUrl,
      ];

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
