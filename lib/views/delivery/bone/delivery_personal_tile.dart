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
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTextStyle.semiBold16(AppColors.gunmetal),
            ),
            const SizedBox(width: 8),
            Text(
              info,
              style: AppTextStyle.regular12(AppColors.granite),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 54,
          height: 54,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.greenWhite),
          ),
          child: SvgPicture.asset(AppIcons.telephone.svg),
        )
      ],
    );
  }
}
