import 'dart:io';

import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final String imagePath;

  const ImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Captured Image"),
        centerTitle: true,
      ),
      body: Center(
        child: imagePath.isEmpty
            ? const Text('No image selected')
            : Image.file(File(imagePath)), // Display the image
      ),
    );
  }
}
