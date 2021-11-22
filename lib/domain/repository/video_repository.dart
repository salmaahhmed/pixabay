import 'package:pixabay_task/domain/model/video_model.dart';

abstract class VideoRepository {
  Future<List<VideoModel>> getVideos(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  );
}
