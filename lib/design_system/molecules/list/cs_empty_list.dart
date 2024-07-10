import '../../../core/core.dart';
import '../../design_system.dart';
import 'package:flutter/material.dart';

class CSEmptyList extends StatelessWidget {
  final List? list;
  final Widget child;
  const CSEmptyList({
    super.key,
    this.list,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (list != null && list!.isNotEmpty) {
      return child;
    }
    return CSInfoText(text: context.tr('design_system.list.empty'));
  }
}
