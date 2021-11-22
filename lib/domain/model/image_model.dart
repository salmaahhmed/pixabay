class ImageModel {
  ImageModel({
    this.id,
    this.pageURL,
    this.type,
    this.tags,
    this.previewURL,
    this.previewWidth,
    this.previewHeight,
    this.webformatURL,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageURL,
    this.fullHDURL,
    this.imageURL,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageURL,
  });
  final int? id;
  final String? pageURL;
  final String? type;
  final List<String>? tags;
  final String? previewURL;
  final int? previewWidth;
  final int? previewHeight;
  final String? webformatURL;
  final int? webformatWidth;
  final int? webformatHeight;
  final String? largeImageURL;
  final String? fullHDURL;
  final String? imageURL;
  final int? imageWidth;
  final int? imageHeight;
  final int? imageSize;
  final int? views;
  final int? downloads;
  final int? likes;
  final int? comments;
  final int? userId;
  final String? user;
  final String? userImageURL;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id'],
        pageURL: json['pageURL'],
        type: json['type'],
        tags: json['tags'],
        previewURL: json['previewURL'],
        previewWidth: json['previewWidth'],
        previewHeight: json['previewHeight'],
        webformatURL: json['webformatURL'],
        webformatWidth: json['webformatWidth'],
        webformatHeight: json['webformatHeight'],
        largeImageURL: json['largeImageURL'],
        fullHDURL: json['fullHDURL'],
        imageURL: json['imageURL'],
        imageWidth: json['imageWidth'],
        imageHeight: json['imageHeight'],
        imageSize: json['imageSize'],
        views: json['views'],
        downloads: json['downloads'],
        likes: json['likes'],
        comments: json['comments'],
        userId: json['user_id'],
        user: json['user'],
        userImageURL: json['userImageURL'],
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['pageURL'] = pageURL;
    _data['type'] = type;
    _data['tags'] = tags;
    _data['previewURL'] = previewURL;
    _data['previewWidth'] = previewWidth;
    _data['previewHeight'] = previewHeight;
    _data['webformatURL'] = webformatURL;
    _data['webformatWidth'] = webformatWidth;
    _data['webformatHeight'] = webformatHeight;
    _data['largeImageURL'] = largeImageURL;
    _data['fullHDURL'] = fullHDURL;
    _data['imageURL'] = imageURL;
    _data['imageWidth'] = imageWidth;
    _data['imageHeight'] = imageHeight;
    _data['imageSize'] = imageSize;
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
