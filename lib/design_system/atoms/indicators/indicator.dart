import '../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color? color;
  const Indicator({super.key, this.color});

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
