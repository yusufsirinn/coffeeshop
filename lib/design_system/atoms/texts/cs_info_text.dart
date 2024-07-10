import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../design_system.dart';

class CSInfoText extends StatelessWidget {
  final String? text;
  const CSInfoText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          text ?? '',
          style: AppTextStyle.semiBold14(AppColors.dune),
        ),
      ),
    );
  }
}
