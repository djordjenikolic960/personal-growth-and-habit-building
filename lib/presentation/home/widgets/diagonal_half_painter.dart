import 'package:flutter/material.dart';

class DiagonalHalfPainter extends CustomPainter {
  final Color color;

  DiagonalHalfPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeJoin = StrokeJoin.round;
    const radius = 4.0;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final path = Path();
    path.moveTo(0.0 + radius, size.height - radius);
    path.arcToPoint(Offset(0.0 + (radius * 2), size.height),
        radius: const Radius.circular(radius), clockwise: false);
    path.lineTo(size.width - radius * 2, size.height);
    path.arcToPoint(Offset(size.width - radius, size.height - radius),
        radius: const Radius.circular(radius), clockwise: false);
    path.lineTo(0.0 + radius * 2, 0.0 + radius);
    path.arcToPoint(const Offset(0.0 + radius, 0.0 + radius),
        radius: const Radius.circular(radius * 1.4), clockwise: false);
    path.close();

    // Clip the rounded rectangle with the diagonal path
    canvas.clipPath(path);

    // Draw the clipped rectangle
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(DiagonalHalfPainter oldDelegate) {
    return true;
  }
}
