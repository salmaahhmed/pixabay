import 'package:injectable/injectable.dart';
import 'package:pixabay_task/domain/model/video_model.dart';
import 'package:pixabay_task/domain/repository/video_repository.dart';

abstract class GetVideosUseCase {
  Future<List<VideoModel>> call(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  );
}

@Injectable(as: GetVideosUseCase)
class GetVideos implements GetVideosUseCase {
  final VideoRepository repository;

  GetVideos(this.repository);

  @override
  Future<List<VideoModel>> call(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  ) async =>
      repository.getVideos(type, sort, page, category, perPage);
}
