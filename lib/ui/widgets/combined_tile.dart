import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_task/domain/model/image_model.dart';
import 'package:pixabay_task/domain/model/video_model.dart';
import 'package:pixabay_task/ui/widgets/video_item.dart';

class CombinedTile extends StatefulWidget {
  const CombinedTile({
    required this.combinedItem,
    required this.onTap,
  });
  final dynamic combinedItem;
  final VoidCallback onTap;

  @override
  State<StatefulWidget> createState() {
    return CombinedTileState();
  }
}

class CombinedTileState extends State<CombinedTile> {
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
                  child: getImageWidget(widget.combinedItem),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.combinedItem.pageURL.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                            "Creation date : ${getCreationDate(widget.combinedItem)}"),
                        SizedBox(height: 5),
                        Text(
                            "Resolution: ${getResolution(widget.combinedItem)}"),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            ChoiceChip(
                              selectedColor: Colors.lightBlue.shade100,
                              selected: true,
                              label: getIcon(widget.combinedItem),
                            ),
                            SizedBox(width: 30),
                            Row(
                              children: [
                                Icon(
                                  Icons.thumb_up,
                                  size: 20,
                                ),
                                SizedBox(width: 3),
                                Container(
                                  child: Text(
                                    '${widget.combinedItem.likes}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
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

  getImageWidget(combinedItem) {
    if (combinedItem is ImageModel) {
      return CachedNetworkImage(
        imageUrl: widget.combinedItem.previewURL ??
            "http://via.placeholder.com/350x150",
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      );
    } else if (combinedItem is VideoModel) {
      return VideoItem(widget.combinedItem.videos.small.url);
    }
  }

  String getCreationDate(combinedItem) {
    final List<String> strings = combinedItem.userImageURL?.split('/') ?? [];
    if (strings.isNotEmpty && strings.length == 8)
      return strings[4] + "/" + strings[5] + "/" + strings[6];
    else
      return "Creation date not available";
  }

  getIcon(combinedItem) {
    if (combinedItem is ImageModel) {
      return Icon(Icons.image);
    } else if (combinedItem is VideoModel) {
      return Icon(Icons.movie);
    }
  }

  String getResolution(combinedItem) {
    if (combinedItem is ImageModel) {
      return "${combinedItem.imageWidth}x${combinedItem.imageHeight}";
    } else if (combinedItem is VideoModel) {
      return "${combinedItem.videos?.small?.width}x${combinedItem.videos?.small?.height}";
    }
    return "";
  }
}
