import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../design_system.dart';

class CSBottomNavigationBarContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const CSBottomNavigationBarContainer({
    super.key,
    required this.child,
    this.height = AppDimension.x60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppDimension.x20),
          topLeft: Radius.circular(AppDimension.x20),
        ),
        border: Border(
          top: BorderSide(color: AppColors.seashell),
        ),
      ),
      child: child,
    );
  }
}
