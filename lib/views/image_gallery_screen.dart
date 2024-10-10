import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_project/view_model/image_gallery_viewmodel.dart';
import 'widgets/image_card.dart';

class ImageGalleryScreen extends ConsumerStatefulWidget {
  const ImageGalleryScreen({super.key});

  @override
  ConsumerState<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends ConsumerState<ImageGalleryScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      ref.read(imageGalleryViewModelProvider.notifier).loadMoreImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    final images = ref.watch(imageGalleryViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery'),
      ),
      body: images.when(
        data: (imageList) => CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) => ImageCard(image: imageList[index]),
                childCount: imageList.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
      ),
    );
  }
}