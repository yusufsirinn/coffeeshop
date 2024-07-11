part of '../order_page.dart';

class OrderTitle extends StatelessWidget {
  final String text;
  final double? fontSize;

  const OrderTitle({
    super.key,
    required this.text,
    this.fontSize = AppDimension.x16,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.tr(text),
      style: AppTextStyle.semiBold16(
        AppColors.thunder,
      ).copyWith(fontSize: fontSize),
    );
  }
}
