import 'package:dio/dio.dart';
import 'package:image_project/models/image_item.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class PixabayService {
  final String? _apiKey = dotenv.env['API_KEY'];
  final String _baseUrl = 'https://pixabay.com/api/';
  late final Dio _dio;

  PixabayService() {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      queryParameters: {'key': _apiKey},
    ));

    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  Future<List<ImageItem>> fetchImages(int page) async {
    try {
      final response = await _dio.get('', queryParameters: {
        'page': page,
        'per_page': 40,
      });

      if (response.statusCode == 200) {
        final data = response.data;
        return (data['hits'] as List).map((item) => ImageItem.fromJson(item)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to load images: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {

      throw Exception('Failed to load images: ${e.message}');
    }
  }
}