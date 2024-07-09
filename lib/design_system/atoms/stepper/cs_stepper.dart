import 'package:flutter/cupertino.dart';

import '../../../core/core.dart';

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
      height: 4,
      child: Row(
        children: List.generate(
          totalStep,
          (index) => step(index < currentStep),
        ),
      ).separate(const SizedBox(width: 10)),
    );
  }

  Expanded step(bool isComplate) {
    return Expanded(
      child: Container(
        height: 4,
        decoration: BoxDecoration(
          color: isComplate ? AppColors.greenishTeal : AppColors.lavender,
        ),
      ),
    );
  }
}
