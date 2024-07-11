part of '../order_page.dart';

class OrderBottomNavigationBar extends StatelessWidget {
  const OrderBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CSBottomNavigationBarContainer(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.x30,
          vertical: AppDimension.x16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.moneys.svg),
                const SizedBox(width: AppDimension.x22),
                Container(
                  height: AppDimension.x24,
                  decoration: BoxDecoration(
                    color: AppColors.springWood,
                    borderRadius: BorderRadius.circular(AppDimension.x20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: AppDimension.x24,
                        decoration: BoxDecoration(
                          color: AppColors.orangeSalmon,
                          borderRadius: BorderRadius.circular(AppDimension.x20),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: AppDimension.x10),
                        child: Text(
                          context.tr('order.navBar.paymentType'),
                          style: AppTextStyle.regular12(Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppDimension.x10,
                          right: AppDimension.x16,
                        ),
                        child: Text(
                          r'$ 5.53',
                          style: AppTextStyle.regular12(AppColors.thunder),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(AppIcons.dots.svg),
              ],
            ),
            const SizedBox(height: AppDimension.x16),
            CSButton(
              text: 'order.navBar.button',
              onPressed: () {
                AppNavigator.instance.go(const DeliveryPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
