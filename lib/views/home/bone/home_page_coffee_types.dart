part of '../home_page.dart';

class HomePageCoffeeTypes extends StatelessWidget {
  final int selectedIndex;
  final List<String> coffees;
  final Function(int) onTap;

  const HomePageCoffeeTypes({
    super.key,
    required this.selectedIndex,
    required this.coffees,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.x36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: coffees.length,
        padding: const EdgeInsets.symmetric(horizontal: AppDimension.x30),
        shrinkWrap: true,
        separatorBuilder: (_, __) {
          return const SizedBox(width: 7);
        },
        itemBuilder: (ctx, i) {
          return GestureDetector(
            onTap: () {
              onTap(i);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimension.x16,
                vertical: AppDimension.x10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimension.x12),
                color: i == selectedIndex ? AppColors.orangeSalmon : AppColors.aquaHaze,
              ),
              child: Text(
                coffees[i],
                style: AppTextStyle.semiBold14(Colors.white).copyWith(
                  color: i == selectedIndex ? Colors.white : AppColors.plantation,
                  fontWeight: i == selectedIndex ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
