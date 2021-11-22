import 'package:injectable/injectable.dart';
import 'package:pixabay_task/data/data_source/videos_remote_data_source.dart';
import 'package:pixabay_task/data/mapper/video_remote_mapper.dart';
import 'package:pixabay_task/domain/model/video_model.dart';
import 'package:pixabay_task/domain/repository/video_repository.dart';

@LazySingleton(as: VideoRepository)
class VideoRepositoryImpl implements VideoRepository {
  final VideoRemoteDataSource remoteDataSource;
  final VideoMapper mapper;

  VideoRepositoryImpl(this.remoteDataSource, this.mapper);

  @override
  Future<List<VideoModel>> getVideos(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  ) async {
    final videos =
        await remoteDataSource.getVideos(type, sort, page, category, perPage);
    return videos.map((e) => mapper.mapTo(e)).toList();
  }
}
