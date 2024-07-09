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
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.thunder,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                context.tr('home.ingredients.with').args([ingredients.join(', ')]),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.starDust,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.thunder, fontSize: 16, fontWeight: FontWeight.w600, shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black.withOpacity(.25),
                            offset: const Offset(0, 4),
                          )
                        ]),
                        children: [
                          TextSpan(
                            text: ' (230)',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.granite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
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
                Images.bean.png,
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
                Images.milk.png,
                height: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
