import 'package:injectable/injectable.dart';
import 'package:pixabay_task/data/data_source/images_remote_data_source.dart';
import 'package:pixabay_task/data/mapper/image_remote_mapper.dart';
import 'package:pixabay_task/domain/model/image_model.dart';
import 'package:pixabay_task/domain/repository/image_repository.dart';

@LazySingleton(as: ImageRepository)
class ImageRepositoryImpl implements ImageRepository {
  final ImageRemoteDataSource remoteDataSource;
  final ImageMapper mapper;

  ImageRepositoryImpl(this.remoteDataSource, this.mapper);

  @override
  Future<List<ImageModel>> getImages(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  ) async {
    final images =
        await remoteDataSource.getImages(type, sort, page, category, perPage);
    return images.map((e) => mapper.mapTo(e)).toList();
  }
}
