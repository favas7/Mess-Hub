import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Menuviewer extends StatelessWidget {
  final int index;
  final Map<String, dynamic> data;

  const Menuviewer({Key? key, required this.index, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Viewer'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'VEG MENU',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => _openImagePreview(context, data['nonvegimage']),
              child: Image.network(data['nonvegimage']),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'NON VEG MENU',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () => _openImagePreview(context, data['vegimage']),
              child: Image.network(data['vegimage']),
            ),
          ],
        ),
      ),
    );
  }

  void _openImagePreview(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePreviewScreen(imageUrl: imageUrl),
      ),
    );
  }
}

class ImagePreviewScreen extends StatelessWidget {
  final String imageUrl;

  const ImagePreviewScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Preview'),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage(imageUrl),
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
