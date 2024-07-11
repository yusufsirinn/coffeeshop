part of '../delivery_page.dart';

class DeliveryOrderTile extends StatefulWidget {
  const DeliveryOrderTile({super.key});

  @override
  State<DeliveryOrderTile> createState() => _DeliveryOrderTileState();
}

class _DeliveryOrderTileState extends State<DeliveryOrderTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension.x66,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppDimension.x14),
        border: Border.all(color: AppColors.greenWhite),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppDimension.x24),
      child: Row(
        children: [
          Image.asset(
            AppImages.bike.png,
          ),
          const SizedBox(width: AppDimension.x24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('delivery.order.title'),
                  style: AppTextStyle.semiBold12(AppColors.gunmetal),
                ),
                const SizedBox(width: AppDimension.x4),
                Text(
                  context.tr('delivery.order.subtitle'),
                  style: AppTextStyle.regular12(AppColors.granite),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
