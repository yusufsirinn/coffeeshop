part of '../order_page.dart';

class OrderPriceText extends StatelessWidget {
  final String text;
  final String price;
  final String? discount;

  const OrderPriceText({
    super.key,
    required this.text,
    required this.price,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          context.tr(text),
          style: AppTextStyle.regular14(AppColors.thunder),
        ),
        const Spacer(),
        if (discount != null) const SizedBox(width: AppDimension.x8),
        if (discount != null)
          Text(
            discount!,
            style: AppTextStyle.regular14(AppColors.thunder).copyWith(
              decoration: TextDecoration.lineThrough,
            ),
          ),
        const SizedBox(width: AppDimension.x8),
        Text(
          price,
          style: AppTextStyle.semiBold14(
            AppColors.thunder,
          ),
        ),
      ],
    );
  }
}
