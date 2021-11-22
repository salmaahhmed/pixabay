import 'package:pixabay_task/domain/model/image_model.dart';

abstract class ImageRepository {
  Future<List<ImageModel>> getImages(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  );
}
