
import 'package:image_project/models/image_item.dart';
import 'package:image_project/services/pixabay_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';


part 'image_gallery_viewmodel.g.dart';

// ViewModel for managing the state of the image gallery
@riverpod
class ImageGalleryViewModel extends _$ImageGalleryViewModel {
  late final PixabayService _pixabayService;

  @override
  Future<List<ImageItem>> build() async {

    _pixabayService = PixabayService();

    return _fetchImages(1);
  }

  Future<List<ImageItem>> _fetchImages(int page) async {
    try {
      // Use the PixabayService to fetch images
      return await _pixabayService.fetchImages(page);
    } on DioException catch (e) {

      throw Exception('Failed to load images: ${e.message}');
    } catch (e) {

      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> loadMoreImages() async {
    final currentState = await future;
    // Calculate the next page number
    final nextPage = (currentState.length ~/ 40) + 1;
    try {
      // Fetch new images
      final newImages = await _fetchImages(nextPage);
      // Update the state with the new images
      state = AsyncData([...currentState, ...newImages]);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}