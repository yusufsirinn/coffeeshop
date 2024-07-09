import 'package:flutter/material.dart';

import '../../../core/core.dart';

class BottomNavigationBarContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const BottomNavigationBarContainer({
    super.key,
    required this.child,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(color: AppColors.seashell),
        ),
      ),
      child: child,
    );
  }
}
