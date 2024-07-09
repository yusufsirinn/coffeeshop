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
        elevation: 0,
        minimumSize: const Size(0, 55),
        maximumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        context.tr(text),
        style: context.theme.textTheme.bodyMedium!.copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
