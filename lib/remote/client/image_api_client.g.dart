// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ImageApiClient implements ImageApiClient {
  _ImageApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://pixabay.com/api';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Image>> getImages(
      type, sort, page, apiKey, category, perPage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      'image_type': type,
      'order': sort,
      'page': page,
      'key': apiKey,
      'q': category,
      'per_page': perPage
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<List<dynamic>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = List<Image>.from(_result.data!["hits"]
        .map((dynamic i) => Image.fromJson(i as Map<String, dynamic>))
        .toList());

    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
