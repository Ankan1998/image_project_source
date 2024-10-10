import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/image_gallery_screen.dart';

// Main entry point of the application
void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    // Wrap the app with ProviderScope to enable Riverpod functionality
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageGalleryScreen(),
    );
  }
}
