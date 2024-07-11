part of '../home_page.dart';

class HomePagePromoCard extends StatelessWidget {
  final String text;
  const HomePagePromoCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimension.x30,
      ),
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.promoCoffee.png),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(AppDimension.x16),
              ),
            ),
            Positioned(
              left: AppDimension.x24,
              top: AppDimension.x12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimension.x4,
                      horizontal: AppDimension.x6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.valentineRed,
                      borderRadius: BorderRadius.circular(AppDimension.x8),
                    ),
                    child: Text(
                      context.tr('home.promoCard.text'),
                      style: AppTextStyle.semiBold14(Colors.white),
                    ),
                  ),
                  const SizedBox(height: AppDimension.x12),
                  Column(
                    children: [
                      CSTextWithBackgroundPainter(
                        text: text,
                        backgroundColor: Colors.black,
                        textStyle: AppTextStyle.regular32(Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
