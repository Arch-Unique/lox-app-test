import 'package:flutter/material.dart';

class RegPainter extends CustomClipper<Path> {
  final regPaint = Paint()..color = Colors.white;

  @override
  Path getClip(Size size) {
    final y = size.height;
    final x = size.width;
    final path = Path();
    path.moveTo(0, y);
    path.lineTo(x, y);
    path.lineTo(x, 0.5 * y);
    path.quadraticBezierTo(x, 0.48 * y, x - 32, (0.48 * y) - 32);
    path.lineTo((0.5 * x) + 32, (y * 0.23) + 32);
    path.quadraticBezierTo(x / 2, y * 0.23, (0.5 * x) - 32, (y * 0.23) + 32);
    path.lineTo(32, (0.48 * y) - 32);
    path.quadraticBezierTo(0, 0.48 * y, 0, (0.5 * y));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
