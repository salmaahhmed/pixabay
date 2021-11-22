import 'package:pixabay_task/data/response/video.dart';

abstract class VideoRemoteDataSource {
  Future<List<Video?>> getVideos(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  );
}
