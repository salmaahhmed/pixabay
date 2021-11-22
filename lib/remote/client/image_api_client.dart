import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pixabay_task/data/response/image.dart';
import 'package:retrofit/retrofit.dart';

part 'image_api_client.g.dart';

@RestApi(baseUrl: "https://pixabay.com/api")
@injectable
abstract class ImageApiClient {
  @factoryMethod
  factory ImageApiClient(Dio dio) = _ImageApiClient;

  @GET("/")
  
  Future<List<Image>> getImages(
    @Query("image_type") String type,
    @Query("order") String sort,
    @Query("page") int page,
    @Query("key") String apiKey,
    @Query("q") String category,
    @Query("per_page") int perPage,
  );
}
