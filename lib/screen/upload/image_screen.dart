import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stack_food/widgets/custom_button.dart';

import '../../util/responsiveSize.dart';

class ImageScreen extends StatelessWidget {
  final String imagePath;

  const ImageScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: imagePath.isEmpty
              ? const Text('No image selected')
              : Column(
                children: [
                  Text("Loaded Fries",style: TextStyle(fontSize: responsiveSize(context, 0.025, 0.0).height),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                    child: Image.file(File(imagePath)),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
                    child: CustomButton(
                      radius: 30,
                        onPressed: (){},
                        child: Text("Upload",style: TextStyle(color: Colors.white,fontSize: responsiveSize(context, 0.022, 0.0).height),)
                    ),
                  )
                ],
              ), // Display the image
        ),
      ),
    );
  }
}
