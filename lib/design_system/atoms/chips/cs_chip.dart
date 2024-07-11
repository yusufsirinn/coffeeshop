import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';
import '../../design_system.dart';

class CSChip extends StatelessWidget {
  final AppIcons icon;
  final String text;
  const CSChip({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 27,
        padding: const EdgeInsets.symmetric(horizontal: AppDimension.x12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppDimension.x16),
          border: Border.all(
            color: AppColors.gainsboro,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon.svg),
            const SizedBox(width: AppDimension.x4),
            Text(
              context.tr(text),
              style: AppTextStyle.regular12(AppColors.gunmetal),
            ),
          ],
        ),
      ),
    );
  }
}
