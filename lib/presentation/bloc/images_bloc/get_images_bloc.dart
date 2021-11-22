import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/domain/model/image_model.dart';
import 'package:pixabay_task/domain/use_case/get_images_by_category_use_case.dart';

part 'get_images_event.dart';
part 'get_images_state.dart';

@LazySingleton()
class GetImagesBloc extends Bloc<GetImageEvent, GetImagesState> {
  final GetImagesUseCase getImageUseCase;
  GetImagesBloc(this.getImageUseCase) : super(GetImagesInitial());

  List<ImageModel> Image = [];
  int pageNumber = 1;
  String type = "all";
  String sort = "popular";
  String category = "";

  @override
  Stream<GetImagesState> mapEventToState(
    GetImageEvent event,
  ) async* {
    if (event is GetImagesEvent) {
      yield* _mapToGetImageEvent(event);
    } else if (event is LoadMoreImage) {
      yield* _getImage(type, sort, category, page: pageNumber);
    } else if (event is FilterSortImage) {
      pageNumber = 1;
      this.add(GetImagesEvent(event.filter, event.sort, category));
    }
  }

  Stream<GetImagesState> _mapToGetImageEvent(GetImagesEvent event) async* {
    type = event.state;
    sort = event.sort;
    category = event.category;
    yield GetImagesLoading();
    yield* _getImage(type, sort, category);
  }

  Stream<GetImagesState> _getImage(String type, String sort, String category,
      {int page = 1}) async* {
    var currentState = state;
    try {
      List<ImageModel> Image =
          await getImageUseCase.call(type, sort, page, category, 20) ?? [];
      if (currentState is GetImagesSuccess) {
        Image = currentState.Images + Image;
      }
      pageNumber++;
      yield GetImagesSuccess(
          Images: Image, hasReachedEnd: Image.isEmpty ? true : false);
    } catch (ex) {
      if (page == 1)
        yield GetImagesFail(ex.toString());
      else
        yield GetImagesSuccess(
          Images: currentState is GetImagesSuccess ? currentState.Images : [],
          hasReachedEnd: true,
        );
    }
  }
}
