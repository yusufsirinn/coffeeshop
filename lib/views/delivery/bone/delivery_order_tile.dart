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
      height: 66,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.greenWhite),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 23.5),
      child: Row(
        children: [
          Image.asset(
            AppImages.bike.png,
          ),
          const SizedBox(width: 25),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('delivery.order.title'),
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.gunmetal,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  context.tr('delivery.order.subtitle'),
                  style: context.theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.granite,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
