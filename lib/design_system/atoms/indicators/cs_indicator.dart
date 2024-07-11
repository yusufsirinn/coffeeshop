import 'package:flutter/material.dart';

import '../../design_system.dart';

class CSIndicator extends StatelessWidget {
  final Color? color;
  const CSIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: AppDimension.x32,
        child: CircularProgressIndicator(
          color: color ?? AppColors.orangeSalmon,
        ),
      ),
    );
  }
}
