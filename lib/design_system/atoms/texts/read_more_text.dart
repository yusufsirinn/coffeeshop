import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final String readMoreText;
  final String showLessText;
  final TextStyle textStyle;
  final TextStyle readMoreStyle;

  final int trimLines;

  const ReadMoreText({
    super.key,
    required this.text,
    required this.trimLines,
    required this.readMoreText,
    required this.showLessText,
    required this.textStyle,
    required this.readMoreStyle,
  });

  @override
  ReadMoreTextState createState() => ReadMoreTextState();
}

class ReadMoreTextState extends State<ReadMoreText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    TextSpan link = TextSpan(
      text: ' ${_readMore ? widget.readMoreText : widget.showLessText}',
      style: widget.readMoreStyle,
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          setState(() {
            _readMore = !_readMore;
          });
        },
    );
    var ellipsis = '... ';
    return LayoutBuilder(
      builder: (context, size) {
        final TextSpan textSpanInit = TextSpan(
          text: text + widget.readMoreText,
          style: widget.textStyle,
        );

        final TextSpan textSpan = TextSpan(
          text: text,
          style: widget.textStyle,
        );

        final TextPainter textPainterInit = TextPainter(
          text: textSpanInit,
          textDirection: TextDirection.ltr,
        )..layout(minWidth: size.minWidth, maxWidth: size.maxWidth);

        int lineCount = textPainterInit.computeLineMetrics().length;

        final TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: _readMore ? widget.trimLines : null,
          textDirection: TextDirection.ltr,
        )..layout(minWidth: size.minWidth, maxWidth: size.maxWidth);

        final cutoffOffset = textPainter
            .getPositionForOffset(Offset(size.maxWidth, textPainter.preferredLineHeight * widget.trimLines))
            .offset;

        String truncatedText = text.substring(0, cutoffOffset);
        if (truncatedText.contains(" ")) {
          int lastSpaceIndex = truncatedText.lastIndexOf(" ");
          truncatedText = truncatedText.substring(0, lastSpaceIndex - (widget.readMoreText.length + ellipsis.length));
        }

        final textWithLink = TextSpan(
          text: _readMore ? truncatedText + ellipsis : text,
          style: widget.textStyle,
          children: <TextSpan>[link],
        );

        if (lineCount <= 3) {
          return RichText(
            text: TextSpan(
              text: text,
              style: widget.textStyle,
            ),
          );
        }

        return RichText(
          text: textWithLink,
        );
      },
    );
  }
}
