part of 'get_videos_bloc.dart';

abstract class GetVideoEvent extends Equatable {
  const GetVideoEvent();

  @override
  List<Object> get props => [];
}

class GetVideo extends GetVideoEvent {
  final String state;
  final String category;
  final String sort;
  final int page = 1;
  GetVideo(this.state, this.sort, this.category, {page});

  @override
  List<Object> get props => [this.state, this.sort, this.page];
}

class LoadMoreVideo extends GetVideoEvent {}

class ViewVideo extends GetVideoEvent {
  final VideoModel Video;

  ViewVideo(this.Video);

  @override
  List<Object> get props => [this.Video];
}

class FilterSortVideo extends GetVideoEvent {
  final String sort;
  final String filter;

  FilterSortVideo({this.sort = "created", this.filter = "all"});

  @override
  List<Object> get props => [this.sort, this.filter];
}
