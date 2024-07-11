part of '../detail_page.dart';

class DetailCoffeeStarRating extends StatelessWidget {
  final String name;
  final List<String> ingredients;
  const DetailCoffeeStarRating({
    super.key,
    required this.name,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyle.semiBold20(AppColors.thunder),
              ),
              const SizedBox(height: AppDimension.x8),
              Text(
                context.tr('home.ingredients.with').args([ingredients.join(', ')]),
                style: AppTextStyle.regular12(AppColors.starDust),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
              const SizedBox(height: AppDimension.x16),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.star.svg,
                    height: AppDimension.x20,
                  ),
                  const SizedBox(width: AppDimension.x4),
                  RichText(
                    text: TextSpan(
                        text: '4.8',
                        style: AppTextStyle.semiBold16(AppColors.thunder).copyWith(shadows: [
                          Shadow(
                            blurRadius: AppDimension.x4,
                            color: Colors.black.withOpacity(.25),
                            offset: const Offset(AppDimension.zero, AppDimension.x4),
                          ),
                        ]),
                        children: [
                          TextSpan(
                            text: ' (230)',
                            style: AppTextStyle.regular12(AppColors.granite),
                          )
                        ]),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: AppDimension.x44,
              height: AppDimension.x44,
              padding: const EdgeInsets.all(AppDimension.x10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(AppDimension.x14),
              ),
              child: Image.asset(
                AppImages.bean.png,
                height: AppDimension.x24,
              ),
            ),
            const SizedBox(width: AppDimension.x16),
            Container(
              width: AppDimension.x44,
              height: AppDimension.x44,
              padding: const EdgeInsets.all(AppDimension.x10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(AppDimension.x14),
              ),
              child: Image.asset(
                AppImages.milk.png,
                height: AppDimension.x24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
