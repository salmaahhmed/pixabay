// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) {
  return Video(
    id: json['id'] as int?,
    pageUrl: json['pageURL'] as String?,
    type: json['type'] as String?,
    tags: json['tags'] as String?,
    duration: json['duration'] as int?,
    pictureId: json['picture_id'] as String?,
    views: json['views'] as int?,
    downloads: json['downloads'] as int?,
    likes: json['likes'] as int?,
    comments: json['comments'] as int?,
    userId: json['user_id'] as int?,
    user: json['user'] as String?,
    userImageUrl: json['userImageURL'] as String?,
  );
}

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'id': instance.id,
      'pageURL': instance.pageUrl,
      'type': instance.type,
      'tags': instance.tags,
      'duration': instance.duration,
      'picture_id': instance.pictureId,
      'views': instance.views,
      'downloads': instance.downloads,
      'likes': instance.likes,
      'comments': instance.comments,
      'user_id': instance.userId,
      'user': instance.user,
      'userImageURL': instance.userImageUrl,
    };
