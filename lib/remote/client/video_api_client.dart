import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_task/data/response/video.dart';
import 'package:retrofit/retrofit.dart';

part 'video_api_client.g.dart';

@RestApi(baseUrl: "https://pixabay.com/api")
@injectable
abstract class VideoApiClient {
  @factoryMethod
  factory VideoApiClient(Dio dio) = _VideoApiClient;

  @GET("/videos/")
  Future<List<Video>> getvideos(
    @Query("video_type") String type,
    @Query("order") String sort,
    @Query("page") int page,
    @Query("key") String apiKey,
    @Query("q") String category,
    @Query("per_page") int perPage,
  );
}
