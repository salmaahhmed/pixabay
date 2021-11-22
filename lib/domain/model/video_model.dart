class VideoModel {
  VideoModel({
    this.id,
    this.pageURL,
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
    this.userImageURL,
    this.videos,
  });
  final int? id;
  final String? pageURL;
  final String? type;
  final List<String>? tags;
  final int? duration;
  final String? pictureId;
  final int? views;
  final int? downloads;
  final int? likes;
  final int? comments;
  final Videos? videos;
  final int? userId;
  final String? user;
  final String? userImageURL;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json['id'],
        pageURL: json['pageURL'],
        type: json['type'],
        tags: json['tags'],
        duration: json['duration'],
        pictureId: json['picture_id'],
        views: json['views'],
        downloads: json['downloads'],
        likes: json['likes'],
        comments: json['comments'],
        userId: json['user_id'],
        user: json['user'],
        videos: Videos.fromJson(json['Videos']),
        userImageURL: json['userImageURL'],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pageURL'] = pageURL;
    _data['type'] = type;
    _data['tags'] = tags;
    _data['duration'] = duration;
    _data['picture_id'] = pictureId;
    _data['views'] = views;
    _data['downloads'] = downloads;
    _data['likes'] = likes;
    _data['comments'] = comments;
    _data['user_id'] = userId;
    _data['user'] = user;
    _data['userImageURL'] = userImageURL;
    return _data;
  }
}

class Videos {
  Videos({
    this.large,
    this.medium,
    this.small,
    this.tiny,
  });

  final VideoProp? large;
  final VideoProp? medium;
  final VideoProp? small;
  final VideoProp? tiny;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        large: VideoProp.fromJson(json["large"]),
        medium: VideoProp.fromJson(json["medium"]),
        small: VideoProp.fromJson(json["small"]),
        tiny: VideoProp.fromJson(json["tiny"]),
      );

  Map<String, dynamic> toJson() => {
        "large": large?.toJson(),
        "medium": medium?.toJson(),
        "small": small?.toJson(),
        "tiny": tiny?.toJson(),
      };
}

class VideoProp {
  VideoProp({
    this.url,
    this.width,
    this.height,
    this.size,
  });

  final String? url;
  final int? width;
  final int? height;
  final int? size;

  factory VideoProp.fromJson(Map<String, dynamic> json) => VideoProp(
        url: json["url"],
        width: json["width"],
        height: json["height"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
        "size": size,
      };
}
