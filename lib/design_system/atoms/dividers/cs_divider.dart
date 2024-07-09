import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CSDivider extends StatelessWidget {
  final Color? color;
  final double thickness;
  const CSDivider({
    super.key,
    this.color,
    this.thickness = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: color ?? AppColors.greenWhite,
      thickness: thickness,
    );
  }
}
