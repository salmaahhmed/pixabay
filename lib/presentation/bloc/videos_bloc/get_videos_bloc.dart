import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/domain/model/video_model.dart';
import 'package:pixabay_task/domain/use_case/get_videos_by_category_use_case.dart';

part 'get_videos_event.dart';
part 'get_videos_state.dart';

@LazySingleton()
class GetVideosBloc extends Bloc<GetVideoEvent, GetVideosState> {
  final GetVideosUseCase getVideoUseCase;
  GetVideosBloc(this.getVideoUseCase) : super(GetVideosInitial());

  List<VideoModel> Video = [];
  int pageNumber = 1;
  String type = "all";
  String sort = "popular";
  String category = "";

  @override
  Stream<GetVideosState> mapEventToState(
    GetVideoEvent event,
  ) async* {
    if (event is GetVideo) {
      yield* _mapToGetVideoEvent(event);
    } else if (event is LoadMoreVideo) {
      yield* _getVideo(type, sort, category, page: pageNumber);
    } else if (event is FilterSortVideo) {
      pageNumber = 1;
      this.add(GetVideo(event.filter, event.sort, category));
    }
  }

  Stream<GetVideosState> _mapToGetVideoEvent(GetVideo event) async* {
    type = event.state;
    sort = event.sort;
    category = event.category;
    yield GetVideosLoading();
    yield* _getVideo(type, sort, category);
  }

  Stream<GetVideosState> _getVideo(String type, String sort, String category,
      {int page = 1}) async* {
    var currentState = state;
    try {
      List<VideoModel> video = await getVideoUseCase.call(
          type, sort, page, category, 20) as List<VideoModel>;
      if (currentState is GetVideosSuccess) {
        video = currentState.videos + video;
      }
      pageNumber++;
      yield GetVideosSuccess(
          videos: video, hasReachedEnd: video.isEmpty ? true : false);
    } catch (ex) {
      if (page == 1)
        yield GetVideosFail(ex.toString());
      else
        yield GetVideosSuccess(
          videos: currentState is GetVideosSuccess ? currentState.videos : [],
          hasReachedEnd: true,
        );
    }
  }
}
