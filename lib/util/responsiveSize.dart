import 'package:flutter/material.dart';

/// Function to calculate responsive size based on screen height and width
Size responsiveSize(BuildContext context, double height, double width) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;

  double height1 = screenHeight * height;
  double width1 = screenWidth * width;

  return Size(width1, height1);
}
