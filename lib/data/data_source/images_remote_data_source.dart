import 'package:pixabay_task/data/response/image.dart';

abstract class ImageRemoteDataSource {
  Future<List<Image?>> getImages(
    String type,
    String sort,
    int page,
    String category,
    int perPage,
  );
}
