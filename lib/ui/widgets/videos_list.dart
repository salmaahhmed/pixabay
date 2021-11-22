import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/di/di.dart';
import 'package:pixabay_task/presentation/bloc/videos_bloc/get_videos_bloc.dart';
import 'package:pixabay_task/ui/widgets/video_overlay.dart';
import 'package:pixabay_task/ui/widgets/video_player.dart';
import 'package:pixabay_task/ui/widgets/video_tile.dart';
import 'bottom_loading_indicator.dart';

class VideosList extends StatelessWidget {
  VideosList({
    Key? key,
    required this.sucessState,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final GetVideosSuccess sucessState;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notificaton) =>
          _handleScrolling(notificaton, sucessState, context),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: sucessState.hasReachedEnd
            ? sucessState.videos.length
            : sucessState.videos.length + 1,
        itemBuilder: (context, index) {
          return index >= sucessState.videos.length
              ? BottomLoadingIndicator()
              : BlocBuilder<GetVideosBloc, GetVideosState>(
                  bloc: getIt.get<GetVideosBloc>(),
                  builder: (context, state) {
                    return VideoTile(
                      onTap: () {
                        showDialog(
                          builder: (ctx) {
                            return VideoOverlay(sucessState.videos[index]);
                          },
                          context: context,
                        );
                      },
                      video: sucessState.videos[index],
                    );
                  },
                );
        },
      ),
    );
  }

  bool _handleScrolling(
      notificaton, GetVideosSuccess currentState, BuildContext context) {
    if (notificaton is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      if (!currentState.hasReachedEnd) {
        getIt.get<GetVideosBloc>().add(LoadMoreVideo());
      }
    }
    return false;
  }
}
