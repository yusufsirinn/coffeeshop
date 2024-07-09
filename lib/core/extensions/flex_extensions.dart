import 'package:flutter/material.dart';

extension FlexExtensions on Flex {
  separate(Widget seperator) {
    final flex = this;

    final iterator = flex.children.iterator;

    if (!iterator.moveNext()) return flex;

    final children = <Widget>[];
    children.add(iterator.current);

    while (iterator.moveNext()) {
      children.add(seperator);
      children.add(iterator.current);
    }

    if (flex.direction == Axis.horizontal) {
      return Row(
        key: flex.key,
        crossAxisAlignment: flex.crossAxisAlignment,
        textBaseline: flex.textBaseline,
        mainAxisAlignment: flex.mainAxisAlignment,
        mainAxisSize: flex.mainAxisSize,
        textDirection: flex.textDirection,
        verticalDirection: flex.verticalDirection,
        children: children,
      );
    } else {
      return Column(
        key: flex.key,
        crossAxisAlignment: flex.crossAxisAlignment,
        textBaseline: flex.textBaseline,
        mainAxisAlignment: flex.mainAxisAlignment,
        mainAxisSize: flex.mainAxisSize,
        textDirection: flex.textDirection,
        verticalDirection: flex.verticalDirection,
        children: children,
      );
    }
  }
}
