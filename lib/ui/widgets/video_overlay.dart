import 'package:flutter/material.dart';
import 'package:pixabay_task/domain/model/video_model.dart';
import 'package:pixabay_task/ui/widgets/video_player.dart';

class VideoOverlay extends StatelessWidget {
  final VideoModel video;
  const VideoOverlay(this.video) : super();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Center(
          child: VideoPlayerCustom(
            video.videos?.medium?.url ?? "",
          ),
        ),
      ),
    );
  }
}
