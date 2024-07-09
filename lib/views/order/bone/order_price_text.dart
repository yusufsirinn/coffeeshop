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
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.thunder,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
        const Spacer(),
        if (discount != null) const SizedBox(width: 8),
        if (discount != null)
          Text(
            discount!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.thunder,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough),
          ),
        const SizedBox(width: 8),
        Text(
          price,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.thunder,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
