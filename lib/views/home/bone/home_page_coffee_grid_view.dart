part of '../home_page.dart';

class HomePageCoffeeGridView extends StatelessWidget {
  final List<Coffee> coffees;
  final Function(int) onTap;
  const HomePageCoffeeGridView({
    super.key,
    required this.coffees,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppDimension.x30),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 9,
        childAspectRatio: 150 / 238,
      ),
      itemCount: coffees.length,
      itemBuilder: (ctx, i) {
        Coffee coffee = coffees[i];
        return Container(
          padding: const EdgeInsets.only(
            left: AppDimension.x4,
            right: AppDimension.x4,
            top: AppDimension.x4,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimension.x20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppDimension.x16),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 141 / 132,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimension.x16),
                        ),
                        child: CSNetworkImage(image: coffee.image),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: AppDimension.x10, sigmaY: AppDimension.x10),
                        child: Container(
                          width: AppDimension.x54,
                          height: AppDimension.x24,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.16),
                              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(AppDimension.x24))),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: AppDimension.x8),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.star.svg,
                                  ),
                                  const SizedBox(width: AppDimension.x2),
                                  Text(
                                    '4.8',
                                    style: AppTextStyle.semiBold10(Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: AppDimension.x12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppDimension.x6),
                    Text(
                      coffee.title ?? '',
                      maxLines: 1,
                      style: AppTextStyle.semiBold16(AppColors.thunder),
                    ),
                    Text(
                      context.tr('home.ingredients.with').args([coffee.ingredients?.first ?? '}']),
                      maxLines: 1,
                      style: AppTextStyle.regular12(AppColors.starDust),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimension.x16),
              Padding(
                padding: const EdgeInsets.only(left: AppDimension.x16, right: AppDimension.x8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$ ' + coffee.price.toString(),
                      style: AppTextStyle.semiBold18(AppColors.plantation),
                    ),
                    InkWell(
                      onTap: () {
                        onTap(i);
                      },
                      child: Container(
                        width: AppDimension.x32,
                        height: AppDimension.x32,
                        padding: const EdgeInsets.all(AppDimension.x8),
                        decoration: BoxDecoration(
                          color: AppColors.orangeSalmon,
                          borderRadius: BorderRadius.circular(AppDimension.x10),
                        ),
                        child: SvgPicture.asset(
                          AppIcons.plus.svg,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
