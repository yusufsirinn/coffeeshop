import '../../design_system.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CSButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CSButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orangeSalmon,
        elevation: AppDimension.zero,
        minimumSize: const Size(AppDimension.zero, AppDimension.x56),
        maximumSize: const Size(double.infinity, AppDimension.x56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimension.x16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        context.tr(text),
        style: AppTextStyle.semiBold16(Colors.white),
      ),
    );
  }
}
