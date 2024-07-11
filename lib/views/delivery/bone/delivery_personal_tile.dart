part of '../delivery_page.dart';

class DeliveryPersonalTile extends StatelessWidget {
  final String name;
  final String info;
  final String image;
  const DeliveryPersonalTile({
    super.key,
    required this.name,
    required this.info,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: AppDimension.x48,
          height: AppDimension.x48,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(AppDimension.x14),
          ),
        ),
        const SizedBox(width: AppDimension.x12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyle.semiBold16(AppColors.gunmetal),
            ),
            const SizedBox(width: AppDimension.x8),
            Text(
              info,
              style: AppTextStyle.regular12(AppColors.granite),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: AppDimension.x54,
          height: AppDimension.x54,
          padding: const EdgeInsets.all(AppDimension.x16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppDimension.x14),
            border: Border.all(color: AppColors.greenWhite),
          ),
          child: SvgPicture.asset(AppIcons.telephone.svg),
        )
      ],
    );
  }
}
