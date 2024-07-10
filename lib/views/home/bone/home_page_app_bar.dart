part of '../home_page.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(context),
                subTitle(context),
              ],
            ),
          ),
          profileImage(),
        ],
      ),
    );
  }

  Container profileImage() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.profilePhoto.png),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Row subTitle(BuildContext context) {
    return Row(
      children: [
        Text(
          context.tr('home.appBar.subtitle'),
          style: AppTextStyle.semiBold14(Colors.white),
        ),
        const SizedBox(width: 2),
        SvgPicture.asset(AppIcons.arrowDown.svg)
      ],
    );
  }

  Text title(BuildContext context) {
    return Text(
      context.tr('home.appBar.title'),
      style: AppTextStyle.regular12(Colors.white),
    );
  }
}
