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
        horizontal: 30,
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
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Positioned(
              left: 23,
              top: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.valentineRed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      context.tr('home.promoCard.text'),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  Column(
                    children: [
                      CSTextWithBackgroundPainter(
                        text: text,
                        backgroundColor: Colors.black,
                        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontSize: 32,
                              height: 40 / 32,
                            ),
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
