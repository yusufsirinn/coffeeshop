part of '../delivery_page.dart';

class DeliveryAppBar extends StatelessWidget {
  const DeliveryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                AppNavigator.instance.pop();
              },
              child: appBarIcon(AppIcons.arrowLeft),
            ),
            appBarIcon(AppIcons.gps),
          ],
        ),
      ),
    );
  }

  Container appBarIcon(AppIcons icon) {
    return Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.plantation.withOpacity(.25),
            blurRadius: 24,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: SvgPicture.asset(icon.svg),
    );
  }
}
