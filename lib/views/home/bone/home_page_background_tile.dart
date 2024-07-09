part of '../home_page.dart';

class HomePageBackgroundTile extends StatelessWidget {
  const HomePageBackgroundTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 270,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.dune,
                AppColors.onyx,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors.snowDrift,
          ),
        )
      ],
    );
  }
}
