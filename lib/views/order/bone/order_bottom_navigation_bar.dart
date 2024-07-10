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
          horizontal: 30,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppIcons.moneys.svg),
                const SizedBox(width: 22),
                Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.springWood,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.orangeSalmon,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          context.tr('order.navBar.paymentType'),
                          style: AppTextStyle.regular12(Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 14,
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
            const SizedBox(height: 17),
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
