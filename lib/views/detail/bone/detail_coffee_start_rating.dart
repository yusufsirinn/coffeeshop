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
              const SizedBox(height: 8),
              Text(
                context.tr('home.ingredients.with').args([ingredients.join(', ')]),
                style: AppTextStyle.regular12(AppColors.starDust),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.star.svg,
                    height: 20,
                  ),
                  const SizedBox(width: 4),
                  RichText(
                    text: TextSpan(
                        text: '4.8',
                        style: AppTextStyle.semiBold16(AppColors.thunder).copyWith(shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.25),
                            offset: const Offset(0, 4),
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
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                AppImages.bean.png,
                height: 24,
              ),
            ),
            const SizedBox(width: 15),
            Container(
              width: 44,
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.forgotMeNot,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Image.asset(
                AppImages.milk.png,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
