import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double notchWidth = 40.0;
    final double notchHeight = 20.0;

    // Start from the top-left corner
    path.lineTo(size.width / 2 - notchWidth / 2, 0);

    // Create the notch
    path.lineTo(size.width / 2, -notchHeight);
    path.lineTo(size.width / 2 + notchWidth / 2, 0);

    // Continue to the top-right corner
    path.lineTo(size.width, 0);

    // Bottom-right corner
    path.lineTo(size.width, size.height);

    // Bottom-left corner
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
