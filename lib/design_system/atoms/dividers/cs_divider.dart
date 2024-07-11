import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../design_system.dart';

class CSDivider extends StatelessWidget {
  final Color? color;
  final double thickness;
  const CSDivider({
    super.key,
    this.color,
    this.thickness = AppDimension.x1,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: AppDimension.zero,
      color: color ?? AppColors.greenWhite,
      thickness: thickness,
    );
  }
}
