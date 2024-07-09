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
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: coffees.length,
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: i == selectedIndex ? AppColors.orangeSalmon : AppColors.aquaHaze,
              ),
              child: Text(
                coffees[i],
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: i == selectedIndex ? Colors.white : AppColors.plantation,
                      fontSize: 14,
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
