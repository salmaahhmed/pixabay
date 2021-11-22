import 'package:flutter/material.dart';
import 'package:pixabay_task/domain/model/video_model.dart';
import 'package:pixabay_task/ui/widgets/video_item.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({
    required this.video,
    required this.onTap,
  });
  final VideoModel video;
  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() {
    return VideoTileState();
  }
}

class VideoTileState extends State<VideoTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: VideoItem(widget.video.videos?.small?.url ?? ""),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.video.pageURL.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text("like count: ${widget.video.likes}"),
                        SizedBox(height: 5),
                        Text("duration: ${widget.video.duration} seconds"),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
