part of '../order_page.dart';

class OrderCounterTile extends StatelessWidget {
  final Coffee coffee;
  const OrderCounterTile({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        coffeeImage(coffee.image),
        const SizedBox(width: 21),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.title ?? '',
                maxLines: 1,
                style: AppTextStyle.semiBold16(AppColors.thunder),
              ),
              const SizedBox(height: 4),
              Text(
                context.tr('home.ingredients.with').args([coffee.ingredients!.join(', ')]),
                maxLines: 1,
                style: AppTextStyle.regular12(AppColors.starDust),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              counterButton(AppIcons.minus),
              Text(
                '1',
                style: AppTextStyle.semiBold16(AppColors.thunder),
              ),
              counterButton(AppIcons.add),
            ],
          ),
        )
      ],
    );
  }

  Container counterButton(AppIcons icon) {
    return Container(
      width: 30,
      height: 30,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.greenWhite,
        ),
      ),
      child: SvgPicture.asset(icon.svg),
    );
  }

  Container coffeeImage(String? image) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image ?? '',
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
