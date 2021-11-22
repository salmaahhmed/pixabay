part of 'get_images_bloc.dart';

abstract class GetImagesState extends Equatable {
  const GetImagesState();

  @override
  List<Object> get props => [];
}

class GetImagesInitial extends GetImagesState {}

class GetImagesLoading extends GetImagesState {}

class GetImagesSuccess extends GetImagesState {
  final List<ImageModel> Images;
  final bool hasReachedEnd;
  GetImagesSuccess({
    required this.Images,
    required this.hasReachedEnd,
  });

  @override
  List<Object> get props => [this.Images, this.hasReachedEnd];
}

class GetImagesFail extends GetImagesState {
  final String error;

  GetImagesFail(this.error);

  @override
  List<Object> get props => [this.error];
}

class ImagesEndResult extends GetImagesState {
  final String error;

  ImagesEndResult(this.error);

  @override
  List<Object> get props => [this.error];
}
