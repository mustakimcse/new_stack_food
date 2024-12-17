import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child; // The widget you want to display inside the button
  final VoidCallback onPressed; // The action when the button is pressed
  final EdgeInsetsGeometry padding; // Padding around the button
  final Color color; // Background color of the button
  final double radius; // Border radius of the button
  final double elevation; // Elevation of the button

  const CustomButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.color = const Color(0xffb80808),
    this.radius = 8.0,
    this.elevation = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(radius),
      child: Ink(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: elevation,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
        ),
        padding: padding,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
