import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  final String url;
  const FullImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Full Image"),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              )
            ],
          ),
          Expanded(
            child: Hero(
              tag: url,
              child: Image.network(
                url,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
