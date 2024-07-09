import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CSIndicator extends StatelessWidget {
  final Color? color;
  const CSIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: 32,
        child: CircularProgressIndicator(
          color: color ?? AppColors.orangeSalmon,
        ),
      ),
    );
  }
}
