import 'package:injectable/injectable.dart';
import 'package:pixabay_task/core/mapper.dart';
import 'package:pixabay_task/data/response/image.dart';
import 'package:pixabay_task/domain/model/image_model.dart';

@injectable
class ImageMapper implements Mapper<Image, ImageModel> {
  @override
  ImageModel mapTo(Image? from) => ImageModel(
        id: from?.id,
        pageURL: from?.pageUrl,
        type: from?.type,
        tags: from?.tags?.split(','),
        previewURL: from?.previewUrl,
        previewWidth: from?.previewWidth,
        previewHeight: from?.previewHeight,
        webformatURL: from?.webformatUrl,
        webformatWidth: from?.webformatWidth,
        webformatHeight: from?.webformatHeight,
        largeImageURL: from?.largeImageUrl,
        fullHDURL: from?.fullHdurl,
        imageURL: from?.imageUrl,
        imageWidth: from?.imageWidth,
        imageHeight: from?.imageHeight,
        imageSize: from?.imageSize,
        views: from?.views,
        downloads: from?.downloads,
        likes: from?.likes,
        comments: from?.comments,
        userId: from?.userId,
        user: from?.user,
        userImageURL: from?.userImageUrl,
      );
}
