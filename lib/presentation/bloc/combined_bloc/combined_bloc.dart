import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/domain/use_case/get_images_by_category_use_case.dart';
import 'package:pixabay_task/domain/use_case/get_videos_by_category_use_case.dart';
import 'package:equatable/equatable.dart';

part 'combined_event.dart';
part 'combined_state.dart';

@LazySingleton()
class GetCombinedBloc extends Bloc<GetCombinedEventBase, GetCombinedState> {
  final GetImagesUseCase getImagesUseCase;
  final GetVideosUseCase getVideosUseCase;
  GetCombinedBloc(this.getImagesUseCase, this.getVideosUseCase)
      : super(GetCombinedInitial());

  List<dynamic> Combined = [];
  int pageNumber = 1;
  String type = "all";
  String sort = "popular";
  String category = "";

  @override
  Stream<GetCombinedState> mapEventToState(
    GetCombinedEventBase event,
  ) async* {
    if (event is GetCombinedEvent) {
      yield* _mapToGetCombinedEvent(event);
    } else if (event is LoadMoreCombined) {
      yield* _getCombined(type, sort, category, page: pageNumber);
    }
  }

  Stream<GetCombinedState> _mapToGetCombinedEvent(
      GetCombinedEvent event) async* {
    type = event.state;
    sort = event.sort;
    category = event.category;
    yield GetCombinedLoading();
    yield* _getCombined(type, sort, category);
  }

  Stream<GetCombinedState> _getCombined(
      String type, String sort, String category,
      {int page = 1}) async* {
    var currentState = state;
    try {
      List<dynamic> myLs = await Future.wait([
        getImagesUseCase.call(type, sort, page, category, 25),
        getVideosUseCase.call(type, sort, page, category, 25)
      ]);
      Combined.addAll(myLs.first);
      Combined.addAll(myLs.last);
      print(Combined);
      Combined.shuffle();
      if (currentState is GetCombinedSuccess) {
        Combined = currentState.combined + Combined;
      }
      pageNumber++;
      yield GetCombinedSuccess(
          combined: Combined, hasReachedEnd: Combined.isEmpty ? true : false);
    } catch (ex) {
      if (page == 1)
        yield GetCombinedFail(ex.toString());
      else
        yield GetCombinedSuccess(
          combined:
              currentState is GetCombinedSuccess ? currentState.combined : [],
          hasReachedEnd: true,
        );
    }
  }
}
