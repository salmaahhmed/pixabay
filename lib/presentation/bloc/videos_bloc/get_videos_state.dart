part of 'get_videos_bloc.dart';

abstract class GetVideosState extends Equatable {
  const GetVideosState();

  @override
  List<Object> get props => [];
}

class GetVideosInitial extends GetVideosState {}

class GetVideosLoading extends GetVideosState {}

class GetVideosSuccess extends GetVideosState {
  final List<VideoModel> videos;
  final bool hasReachedEnd;
  GetVideosSuccess({
    required this.videos,
    required this.hasReachedEnd,
  });

  @override
  List<Object> get props => [this.videos, this.hasReachedEnd];
}

class GetVideosFail extends GetVideosState {
  final String error;

  GetVideosFail(this.error);

  @override
  List<Object> get props => [this.error];
}

class VideosEndResult extends GetVideosState {
  final String error;

  VideosEndResult(this.error);

  @override
  List<Object> get props => [this.error];
}
