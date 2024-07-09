part of '../order_page.dart';

class OrderTitle extends StatelessWidget {
  final String text;
  final double? fontSize;

  const OrderTitle({
    super.key,
    required this.text,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(text),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.thunder,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
