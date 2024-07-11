part of '../delivery_page.dart';

class DeliveryAppBar extends StatelessWidget {
  const DeliveryAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
          horizontal: AppDimension.x30,
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
      width: AppDimension.x44,
      height: AppDimension.x44,
      padding: const EdgeInsets.all(AppDimension.x10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimension.x14),
        boxShadow: [
          BoxShadow(
            color: AppColors.plantation.withOpacity(.25),
            blurRadius: AppDimension.x24,
            offset: const Offset(AppDimension.zero, AppDimension.x4),
          )
        ],
      ),
      child: SvgPicture.asset(icon.svg),
    );
  }
}
