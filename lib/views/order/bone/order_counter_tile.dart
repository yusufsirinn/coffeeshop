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
        const SizedBox(width: AppDimension.x20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffee.title ?? '',
                maxLines: 1,
                style: AppTextStyle.semiBold16(AppColors.thunder),
              ),
              const SizedBox(height: AppDimension.x4),
              Text(
                context.tr('home.ingredients.with').args([coffee.ingredients!.join(', ')]),
                maxLines: 1,
                style: AppTextStyle.regular12(AppColors.starDust),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppDimension.x8),
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
      width: AppDimension.x30,
      height: AppDimension.x30,
      padding: const EdgeInsets.all(AppDimension.x6),
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

  Widget coffeeImage(String? image) {
    return SizedBox.square(
      dimension: AppDimension.x54,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimension.x16),
        child: CSNetworkImage(
          image: image,
        ),
      ),
    );
  }
}
