part of 'get_images_bloc.dart';

abstract class GetImageEvent extends Equatable {
  const GetImageEvent();

  @override
  List<Object> get props => [];
}

class GetImagesEvent extends GetImageEvent {
  final String state;
  final String category;
  final String sort;
  final int page = 1;
  GetImagesEvent(this.state, this.sort, this.category, {page});

  @override
  List<Object> get props => [this.state, this.sort, this.page];
}

class LoadMoreImage extends GetImageEvent {}

class FilterSortImage extends GetImageEvent {
  final String sort;
  final String filter;

  FilterSortImage({this.sort = "created", this.filter = "all"});

  @override
  List<Object> get props => [this.sort, this.filter];
}
