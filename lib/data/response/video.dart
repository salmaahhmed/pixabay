import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pixabay_task/domain/model/video_model.dart';

part 'video.g.dart';

@JsonSerializable()
class Video extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'pageURL')
  final String? pageUrl;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'tags')
  final String? tags;
  @JsonKey(name: 'duration')
  final int? duration;
  @JsonKey(name: 'picture_id')
  final String? pictureId;
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
  Videos? videos;

  Video({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.duration,
    this.pictureId,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
    this.videos,
  });

  @override
  List<Object?> get props => [
        this.id,
        this.pageUrl,
        this.type,
        this.tags,
        this.duration,
        this.pictureId,
        this.views,
        this.downloads,
        this.likes,
        this.comments,
        this.userId,
        this.user,
        this.userImageUrl,
        this.videos,
      ];

  factory Video.fromJson(Map<String, dynamic> json) =>
      _$VideoFromJson(json)..videos = Videos.fromJson(json['videos']);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}

