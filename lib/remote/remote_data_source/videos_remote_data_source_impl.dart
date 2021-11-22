import 'package:injectable/injectable.dart';
import 'package:pixabay_task/core/constants.dart';
import 'package:pixabay_task/data/data_source/videos_remote_data_source.dart';
import 'package:pixabay_task/data/mapper/video_remote_mapper.dart' as mapper;
import 'package:pixabay_task/data/response/video.dart';
import 'package:pixabay_task/remote/client/video_api_client.dart';

@Injectable(as: VideoRemoteDataSource)
class VideoRemoteDataSourceImpl implements VideoRemoteDataSource {
  final mapper.VideoMapper videoMapper;
  final VideoApiClient client;

  VideoRemoteDataSourceImpl(
    this.client,
    this.videoMapper,
  );

  @override
  Future<List<Video>> getVideos(
      String type, String sort, int page, String category, int perPage) async {
    final videos =
        await client.getvideos(type, sort, page, apiKey, category, perPage);
    return videos;
  }
}
