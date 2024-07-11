import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';
import '../../design_system.dart';

class CSStepper extends StatelessWidget {
  final int totalStep;
  final int currentStep;

  const CSStepper({
    super.key,
    required this.totalStep,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.x4,
      child: Row(
        children: List.generate(
          totalStep,
          (index) => step(index < currentStep),
        ),
      ).separate(const SizedBox(width: AppDimension.x10)),
    );
  }

  Expanded step(bool isComplate) {
    return Expanded(
      child: Container(
        height: AppDimension.x4,
        decoration: BoxDecoration(
          color: isComplate ? AppColors.greenishTeal : AppColors.lavender,
        ),
      ),
    );
  }
}
