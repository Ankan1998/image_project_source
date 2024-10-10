import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_item.freezed.dart';
part 'image_item.g.dart';

@freezed
class ImageItem with _$ImageItem {
  // Define the factory constructor
  factory ImageItem({
    required String previewURL,
    required int likes,
    required int views,
  }) = _ImageItem;

  // Define a factory constructor for JSON serialization
  factory ImageItem.fromJson(Map<String, dynamic> json) => _$ImageItemFromJson(json);
}