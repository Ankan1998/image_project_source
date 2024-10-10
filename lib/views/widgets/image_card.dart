import 'package:flutter/material.dart';
import 'package:image_project/models/image_item.dart';
import 'package:image_project/views/full_image.dart';

class ImageCard extends StatelessWidget {
  final ImageItem image;

  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => FullImage(
              url: image.previewURL,
            ),
          ),
        );
      },
      child: Hero(
        tag: image.previewURL,
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  image.previewURL,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Likes: ${image.likes}'),
                    Text('Views: ${image.views}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
