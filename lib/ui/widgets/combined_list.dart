import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/di/di.dart';
import 'package:pixabay_task/domain/model/image_model.dart';
import 'package:pixabay_task/domain/model/video_model.dart';
import 'package:pixabay_task/presentation/bloc/combined_bloc/combined_bloc.dart';
import 'package:pixabay_task/presentation/bloc/images_bloc/get_images_bloc.dart';
import 'package:pixabay_task/ui/widgets/image_overlay.dart';
import 'package:pixabay_task/ui/widgets/video_overlay.dart';
import 'bottom_loading_indicator.dart';
import 'combined_tile.dart';
import 'image_tile.dart';

class CombinedList extends StatelessWidget {
  CombinedList({
    Key? key,
    required this.sucessState,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final GetCombinedSuccess sucessState;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notificaton) =>
          _handleScrolling(notificaton, sucessState, context),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: sucessState.hasReachedEnd
            ? sucessState.combined.length
            : sucessState.combined.length + 1,
        itemBuilder: (context, index) {
          return index >= sucessState.combined.length
              ? BottomLoadingIndicator()
              : BlocBuilder<GetCombinedBloc, GetCombinedState>(
                  bloc: getIt.get<GetCombinedBloc>(),
                  builder: (context, state) {
                    return CombinedTile(
                      onTap: () {
                        if (sucessState.combined[index] is ImageModel) {
                          showDialog(
                              builder: (ctx) {
                                return ImageOverlay(
                                    sucessState.combined[index]);
                              },
                              context: context);
                        } else if (sucessState.combined[index] is VideoModel) {
                          showDialog(
                            builder: (ctx) {
                              return VideoOverlay(sucessState.combined[index]);
                            },
                            context: context,
                          );
                        }
                      },
                      combinedItem: sucessState.combined[index],
                    );
                  },
                );
        },
      ),
    );
  }

  bool _handleScrolling(
      notificaton, GetCombinedSuccess currentState, BuildContext context) {
    if (notificaton is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      if (!currentState.hasReachedEnd) {
        getIt.get<GetCombinedBloc>().add(LoadMoreCombined());
      }
    }
    return false;
  }
}
