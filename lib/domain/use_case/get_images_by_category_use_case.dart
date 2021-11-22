import 'package:injectable/injectable.dart';
import 'package:pixabay_task/domain/model/image_model.dart';
import 'package:pixabay_task/domain/repository/image_repository.dart';

abstract class GetImagesUseCase {
  Future<List<ImageModel>?> call(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  );
}

@Injectable(as: GetImagesUseCase)
class GetImages implements GetImagesUseCase {
  final ImageRepository repository;

  GetImages(this.repository);

  @override
  Future<List<ImageModel>?> call(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  ) async =>
      repository.getImages(type, sort, page, category, perPage);
}
