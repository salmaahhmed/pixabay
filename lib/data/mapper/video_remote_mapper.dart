import 'package:injectable/injectable.dart';
import 'package:pixabay_task/core/mapper.dart';
import 'package:pixabay_task/data/response/video.dart';
import 'package:pixabay_task/domain/model/video_model.dart';

@injectable
class VideoMapper implements Mapper<Video, VideoModel> {
  @override
  VideoModel mapTo(Video? from) => VideoModel(
        id: from?.id,
        pageURL: from?.pageUrl,
        type: from?.type,
        tags: from?.tags?.split(','),
        duration: from?.duration,
        pictureId: from?.pictureId,
        views: from?.views,
        downloads: from?.downloads,
        likes: from?.likes,
        comments: from?.comments,
        userId: from?.userId,
        user: from?.user,
        videos: from?.videos,
        userImageURL: from?.userImageUrl,
      );
}
