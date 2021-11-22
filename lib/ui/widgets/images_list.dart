import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixabay_task/di/di.dart';
import 'package:pixabay_task/presentation/bloc/images_bloc/get_images_bloc.dart';
import 'bottom_loading_indicator.dart';
import 'image_overlay.dart';
import 'image_tile.dart';

class ImagesList extends StatelessWidget {
  ImagesList({
    Key? key,
    required this.sucessState,
  }) : super(key: key);

  final ScrollController _scrollController = ScrollController();
  final GetImagesSuccess sucessState;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notificaton) =>
          _handleScrolling(notificaton, sucessState, context),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: sucessState.hasReachedEnd
            ? sucessState.Images.length
            : sucessState.Images.length + 1,
        itemBuilder: (context, index) {
          return index >= sucessState.Images.length
              ? BottomLoadingIndicator()
              : BlocBuilder<GetImagesBloc, GetImagesState>(
                  bloc: getIt.get<GetImagesBloc>(),
                  builder: (context, state) {
                    return ImageTile(
                      onTap: () {
                        showDialog(
                            builder: (ctx) {
                              return ImageOverlay(sucessState.Images[index]);
                            },
                            context: context);
                      },
                      image: sucessState.Images[index],
                    );
                  },
                );
        },
      ),
    );
  }

  bool _handleScrolling(
      notificaton, GetImagesSuccess currentState, BuildContext context) {
    if (notificaton is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      if (!currentState.hasReachedEnd) {
        getIt.get<GetImagesBloc>().add(LoadMoreImage());
      }
    }
    return false;
  }
}
