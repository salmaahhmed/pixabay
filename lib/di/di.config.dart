// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../data/data_source/images_remote_data_source.dart' as _i6;
import '../data/data_source/videos_remote_data_source.dart' as _i15;
import '../data/mapper/image_remote_mapper.dart' as _i5;
import '../data/mapper/video_remote_mapper.dart' as _i14;
import '../data/repository/image_repository_impl.dart' as _i9;
import '../data/repository/video_repository_impl.dart' as _i18;
import '../data/storage/app_storage.dart' as _i12;
import '../data/storage/storage.dart' as _i11;
import '../domain/repository/image_repository.dart' as _i8;
import '../domain/repository/video_repository.dart' as _i17;
import '../domain/use_case/get_images_by_category_use_case.dart' as _i19;
import '../domain/use_case/get_videos_by_category_use_case.dart' as _i20;
import '../presentation/bloc/combined_bloc/combined_bloc.dart' as _i21;
import '../presentation/bloc/images_bloc/get_images_bloc.dart' as _i22;
import '../presentation/bloc/videos_bloc/get_videos_bloc.dart' as _i23;
import '../remote/client/image_api_client.dart' as _i4;
import '../remote/client/video_api_client.dart' as _i13;
import '../remote/remote_data_source/images_remote_data_source_impl.dart'
    as _i7;
import '../remote/remote_data_source/videos_remote_data_source_impl.dart'
    as _i16;
import 'injector_module.dart' as _i24; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final localModule = _$LocalModule();
  gh.lazySingleton<_i3.Dio>(() => localModule.dio);
  gh.factory<_i4.ImageApiClient>(() => _i4.ImageApiClient(get<_i3.Dio>()));
  gh.factory<_i5.ImageMapper>(() => _i5.ImageMapper());
  gh.factory<_i6.ImageRemoteDataSource>(() => _i7.ImageRemoteDataSourceImpl(
      get<_i4.ImageApiClient>(), get<_i5.ImageMapper>()));
  gh.lazySingleton<_i8.ImageRepository>(() => _i9.ImageRepositoryImpl(
      get<_i6.ImageRemoteDataSource>(), get<_i5.ImageMapper>()));
  await gh.factoryAsync<_i10.SharedPreferences>(() => localModule.prefs,
      preResolve: true);
  gh.lazySingleton<_i11.Storage>(
      () => _i12.AppStorage(get<_i10.SharedPreferences>()));
  gh.factory<_i13.VideoApiClient>(() => _i13.VideoApiClient(get<_i3.Dio>()));
  gh.factory<_i14.VideoMapper>(() => _i14.VideoMapper());
  gh.factory<_i15.VideoRemoteDataSource>(() => _i16.VideoRemoteDataSourceImpl(
      get<_i13.VideoApiClient>(), get<_i14.VideoMapper>()));
  gh.lazySingleton<_i17.VideoRepository>(() => _i18.VideoRepositoryImpl(
      get<_i15.VideoRemoteDataSource>(), get<_i14.VideoMapper>()));
  gh.factory<_i19.GetImagesUseCase>(
      () => _i19.GetImages(get<_i8.ImageRepository>()));
  gh.factory<_i20.GetVideosUseCase>(
      () => _i20.GetVideos(get<_i17.VideoRepository>()));
  gh.lazySingleton<_i21.GetCombinedBloc>(() => _i21.GetCombinedBloc(
      get<_i19.GetImagesUseCase>(), get<_i20.GetVideosUseCase>()));
  gh.lazySingleton<_i22.GetImagesBloc>(
      () => _i22.GetImagesBloc(get<_i19.GetImagesUseCase>()));
  gh.lazySingleton<_i23.GetVideosBloc>(
      () => _i23.GetVideosBloc(get<_i20.GetVideosUseCase>()));
  return get;
}

class _$LocalModule extends _i24.LocalModule {}
