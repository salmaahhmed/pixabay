import 'package:injectable/injectable.dart';
import 'package:pixabay_task/core/constants.dart';
import 'package:pixabay_task/data/data_source/images_remote_data_source.dart';
import 'package:pixabay_task/data/mapper/image_remote_mapper.dart' as mapper;
import 'package:pixabay_task/data/response/image.dart';
import 'package:pixabay_task/remote/client/image_api_client.dart';

@Injectable(as: ImageRemoteDataSource)
class ImageRemoteDataSourceImpl implements ImageRemoteDataSource {
  final mapper.ImageMapper ImageMapper;
  final ImageApiClient client;

  ImageRemoteDataSourceImpl(
    this.client,
    this.ImageMapper,
  );

  @override
  Future<List<Image>> getImages(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  ) async {
    final images =
        await client.getImages(type, sort, page, apiKey, category, perPage);
    return images;
  }
}
