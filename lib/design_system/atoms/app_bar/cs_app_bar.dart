import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/core.dart';

class CSAppBar extends StatelessWidget {
  final String title;
  final Widget? trailing;
  const CSAppBar({
    super.key,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                AppNavigator.instance.pop();
              },
              child: SvgPicture.asset(
                AppIcons.arrowLeft.svg,
              ),
            ),
            Text(
              title,
              style: context.theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.thunder,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            _trailing()
          ],
        ),
      ),
    );
  }

  Widget _trailing() {
    if (trailing != null) {
      return trailing!;
    }
    return const SizedBox(width: 24);
  }
}
