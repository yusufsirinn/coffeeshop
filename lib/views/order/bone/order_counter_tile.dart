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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.thunder,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                context.tr('home.ingredients.with').args([coffee.ingredients!.join(', ')]),
                maxLines: 1,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.starDust,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.thunder,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
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
