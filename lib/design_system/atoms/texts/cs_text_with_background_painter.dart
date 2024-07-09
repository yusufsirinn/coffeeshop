import 'package:flutter/material.dart';

class CSTextWithBackgroundPainter extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;

  const CSTextWithBackgroundPainter({
    super.key,
    required this.text,
    required this.textStyle,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TextBackgroundPainter(
        text: text,
        textStyle: textStyle,
        backgroundColor: backgroundColor,
      ),
    );
  }
}

class _TextBackgroundPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final Color backgroundColor;

  _TextBackgroundPainter({
    required this.text,
    required this.textStyle,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < text.split('\n').length; i++) {
      var line = text.split('\n')[i];
      final textPainter = TextPainter(
        text: TextSpan(text: line, style: textStyle),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      final backgroundHeight = textStyle.fontSize! / 2 + 2;
      final backgroundPaint = Paint()..color = backgroundColor;
      final backgroundRect = Rect.fromLTWH(
        0,
        (textPainter.size.height - backgroundHeight + 3) * (i + 1),
        textPainter.size.width,
        backgroundHeight,
      );
      canvas.drawRect(backgroundRect, backgroundPaint);
      textPainter.paint(canvas, Offset(0, (textStyle.fontSize! * i)));
    }
  }

  @override
  bool shouldRepaint(_TextBackgroundPainter oldDelegate) {
    return oldDelegate.text != text ||
        oldDelegate.textStyle != textStyle ||
        oldDelegate.backgroundColor != backgroundColor;
  }
}
