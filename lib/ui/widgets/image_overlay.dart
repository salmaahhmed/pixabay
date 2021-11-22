import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pixabay_task/domain/model/image_model.dart';

class ImageOverlay extends StatelessWidget {
  final ImageModel image;
  const ImageOverlay(this.image) : super();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: MediaQuery.of(context).size.width * 0.70,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Center(
          child: InteractiveViewer(
            panEnabled: false,
            minScale: 1,
            maxScale: 50,
            child: CachedNetworkImage(
              imageUrl:
                  image.largeImageURL ?? "http://via.placeholder.com/350x150",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ),
    );
  }
}
